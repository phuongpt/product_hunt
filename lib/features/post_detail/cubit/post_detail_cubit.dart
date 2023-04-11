import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit({required this.repository}) : super(const PostDetailState.loading());

  final Repository repository;

  Future<void> fetchData(String slug) async {
    try {
      final item = await repository.fetchPostDetail(slug: slug, refresh: false);
      if (item != null) {
        emit(PostDetailState.success(item));

        //Lazy get comments
        final itemWithComments = await repository.fetchPostDetail(slug: slug, refresh: true);
        if (itemWithComments != null) {
          emit(PostDetailState.update(itemWithComments));
        }
      } else {
        emit(const PostDetailState.failure());
      }
    } catch (_) {
      log('fetchData', name: 'PostDetailCubit', error: _);
      emit(const PostDetailState.failure());
    }
  }

  Future<void> upVote() async {
    emit(PostDetailState.upvote(upVoted: !state.upVoted, item: state.item!));
  }
}
