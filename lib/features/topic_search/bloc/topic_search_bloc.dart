import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'topic_search_event.dart';
part 'topic_search_state.dart';

const _duration = Duration(milliseconds: 1000);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class TopicSearchBloc extends Bloc<TopicSearchEvent, TopicSearchState> {
  TopicSearchBloc({required this.repository}) : super(const TopicSearchState()) {
    on<SearchTermChanged>(_onSearchData, transformer: debounce(_duration));
  }
  final Repository repository;

  Future<void> _onSearchData(
    SearchTermChanged event,
    Emitter<TopicSearchState> emit,
  ) async {
    final searchTerm = event.searchTerm;

    if (searchTerm.isEmpty) return emit(const TopicSearchState());

    if (!state.hasNextPage || state.status == TopicSearchStatus.loading) return;

    try {
      emit(state.copyWith(status: TopicSearchStatus.loading, searchTerm: searchTerm));

      final result = await repository.searchTopics(searchTerm: searchTerm, pageIndex: state.nextPageIndex, itemsPerPage: state.itemsPerPage);
      emit(
        state.copyWith(
          status: TopicSearchStatus.success,
          items: List.of(state.items)..addAll(result.topics),
          hasNextPage: result.hasNextPage,
          nextPageIndex: result.nextPageIndex,
        ),
      );
    } catch (_) {
      log('_onSearchData', name: 'TopicSearchBloc', error: _);
      emit(state.copyWith(status: TopicSearchStatus.failure));
    }
  }
}
