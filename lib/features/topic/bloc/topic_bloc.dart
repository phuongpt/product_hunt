import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'topic_event.dart';
part 'topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc({required this.repository}) : super(const TopicState()) {
    on<TopicFetched>(_onFetchData);
    on<TopicFollowUpdated>(_onUpdateFollow);
  }
  final Repository repository;

  Future<void> _onFetchData(TopicFetched event, Emitter<TopicState> emit) async {
    try {
      final result = await repository.getTrendingTopics();
      emit(
        state.copyWith(trendingStatus: TopicStatus.success, trendingTopics: result.topics),
      );
    } catch (_) {
      log('_onFetchData', name: 'TopicBloc', error: _);
      emit(state.copyWith(trendingStatus: TopicStatus.failure));
    }

    try {
      final result = await repository.getPopularTopics();
      emit(
        state.copyWith(popularStatus: TopicStatus.success, popularTopics: result.topics),
      );
    } catch (_) {
      log('_onFetchData', name: 'TopicBloc', error: _);
      emit(state.copyWith(popularStatus: TopicStatus.failure));
    }

    emit(state.updateFollowings());
  }

  Future<void> _onUpdateFollow(TopicFollowUpdated event, Emitter<TopicState> emit) async {
    try {
      emit(state.updateFollow(event.item));
      await repository.updateFollowingTopic(topicId: event.item.id, follow: !event.item.isFollowing);
    } catch (_) {}
  }
}
