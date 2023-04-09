import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({required this.repository}) : super(const CollectionState()) {
    on<CollectionFetched>(_onFetchData);
    on<CollectionFollowUpdated>(_onUpdateFollow);
  }
  final Repository repository;

  Future<void> _onFetchData(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {
    if (!state.hasNextPage || state.status == CollectionStatus.loading) return;

    try {
      emit(state.copyWith(status: state.status == CollectionStatus.initial ? CollectionStatus.initial : CollectionStatus.loading));

      final result = await repository.fetchCollections(pageIndex: state.nextPageIndex, itemsPerPage: state.itemsPerPage);
      emit(
        state.copyWith(
          status: CollectionStatus.success,
          items: List.of(state.items)..addAll(result.collections),
          hasNextPage: result.hasNextPage,
          nextPageIndex: result.nextPageIndex,
        ),
      );
      emit(state.updateFollowings());
    } catch (_) {
      log('_onFetchData', name: 'CollectionBloc', error: _);
      emit(state.copyWith(status: CollectionStatus.failure));
    }
  }

  Future<void> _onUpdateFollow(CollectionFollowUpdated event, Emitter<CollectionState> emit) async {
    try {
      emit(state.updateFollow(event.item));
      await repository.updateFollowingCollection(collectionId: event.item.id, follow: !event.item.isFollowing);
    } catch (_) {}
  }
}
