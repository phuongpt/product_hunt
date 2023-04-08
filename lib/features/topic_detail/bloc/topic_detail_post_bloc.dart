import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'topic_detail_post_event.dart';
part 'topic_detail_post_state.dart';

class TopicDetailPostBloc extends Bloc<TopicDetailEvent, TopicDetailPostState> {
  TopicDetailPostBloc({required this.repository}) : super(const TopicDetailPostState()) {
    on<TopicDetailPostFetched>(_onFetchData);
  }
  final Repository repository;

  Future<void> _onFetchData(
    TopicDetailPostFetched event,
    Emitter<TopicDetailPostState> emit,
  ) async {
    if (!state.hasNextPage || state.status == TopicDetailPostStatus.loading) return;

    try {
      emit(state.copyWith(status: state.status == TopicDetailPostStatus.initial ? TopicDetailPostStatus.initial : TopicDetailPostStatus.loading));

      final result = await repository.fetchPostsByTopic(topicSlug: event.topicSlug, pageIndex: state.nextPageIndex, itemsPerPage: state.itemsPerPage);
      emit(
        state.copyWith(
          status: TopicDetailPostStatus.success,
          items: List.of(state.items)..addAll(result.posts),
          hasNextPage: result.hasNextPage,
          nextPageIndex: result.nextPageIndex,
        ),
      );
    } catch (_) {
      log('_onFetchData', name: 'TopicDetailPostBloc', error: _);
      emit(state.copyWith(status: TopicDetailPostStatus.failure));
    }
  }
}
