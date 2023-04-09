import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'collection_detail_state.dart';

class CollectionDetailCubit extends Cubit<CollectionDetailState> {
  CollectionDetailCubit({required this.repository}) : super(const CollectionDetailState.loading());

  final Repository repository;

  Future<void> fetchData(String id) async {
    try {
      final item = await repository.fetchCollectionDetail(id: id, refresh: false);
      if (item != null) {
        emit(CollectionDetailState.success(item));

        //Lazy get comments
        final itemWithPosts = await repository.fetchCollectionDetail(id: id, refresh: true);
        if (itemWithPosts != null) {
          emit(CollectionDetailState.update(itemWithPosts));
        }
      } else {
        emit(const CollectionDetailState.failure());
      }
    } catch (_) {
      log('fetchData', name: 'CollectionDetailCubit', error: _);
      emit(const CollectionDetailState.failure());
    }
  }
}
