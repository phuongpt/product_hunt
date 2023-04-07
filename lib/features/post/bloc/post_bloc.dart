import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.repository}) : super(const PostState()) {
    on<PostFetched>(_onFetchData);
  }
  final Repository repository;

  Future<void> _onFetchData(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (!state.hasNextPage || state.status == PostStatus.loading) return;

    try {
      emit(state.copyWith(status: state.status == PostStatus.initial ? PostStatus.initial : PostStatus.loading));

      final result = await repository.fetchPosts(pageIndex: state.nextPageIndex, itemsPerPage: state.itemsPerPage);
      emit(
        state.copyWith(
          status: PostStatus.success,
          items: List.of(state.items)..addAll(result.posts),
          hasNextPage: result.hasNextPage,
          nextPageIndex: result.nextPageIndex,
        ),
      );
    } catch (_) {
      log('_onFetchData', name: 'PostBloc', error: _);
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
