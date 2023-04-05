import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.repository}) : super(const PostState()) {
    on<PostFetched>(
      _onFetch,
    );
  }
  final Repository repository;

  Future<void> _onFetch(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (!state.hasMore) return;
    try {
      if (state.status == PostStatus.initial) {
        final items = await repository.fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            items: items,
            hasMore: false,
          ),
        );
      }
      // final items = await repository.fetchPosts();
      final items = <Post>[];
      items.isEmpty
          ? emit(state.copyWith(hasMore: false))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                items: List.of(state.items)..addAll(items),
                hasMore: true,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
