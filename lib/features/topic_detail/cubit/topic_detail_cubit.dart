import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'topic_detail_state.dart';

class TopicDetailCubit extends Cubit<TopicDetailState> {
  TopicDetailCubit({required this.repository}) : super(const TopicDetailState.loading());

  final Repository repository;

  Future<void> fetchData(String id) async {
    try {
      final item = await repository.fetchTopicDetail(slug: id, refresh: false);
      if (item != null) {
        emit(TopicDetailState.success(item));
      } else {
        emit(const TopicDetailState.failure());
      }
    } catch (_) {
      log('fetchData', name: 'TopicDetailCubit', error: _);
      emit(const TopicDetailState.failure());
    }
  }
}
