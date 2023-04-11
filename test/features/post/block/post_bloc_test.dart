// ignore_for_file: missing_whitespace_between_adjacent_strings, avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/post/post.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  final data = FetchPostsResult(
    posts: [],
    hasNextPage: true,
    nextPageIndex: 'next_cursor',
  );

  group('PostBloc', () {
    late Repository repository;

    setUp(() {
      repository = MockRepository();
    });

    PostBloc buildBloc() => PostBloc(repository: repository);

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(buildBloc().state, equals(const PostState()));
      });
    });

    group('PostFetched', () {
      blocTest<PostBloc, PostState>(
        'starts listening to repository get future of FetchPostsResult',
        build: buildBloc,
        act: (bloc) => bloc.add(PostFetched()),
        verify: (bloc) {
          verify(() => repository.fetchPosts(pageIndex: '', itemsPerPage: 10)).called(1);
        },
      );

      blocTest<PostBloc, PostState>(
        'emits state with updated status, items, hasNextPage, nextPageIndex '
        'when repository get future emits fetchPosts',
        setUp: () {
          when(
            () => repository.fetchPosts(pageIndex: '', itemsPerPage: 10),
          ).thenAnswer((_) => Future.value(data));
        },
        build: buildBloc,
        act: (bloc) => bloc.add(PostFetched()),
        expect: () => [
          const PostState(status: PostStatus.initial),
          const PostState(
            status: PostStatus.success,
            items: [],
            hasNextPage: true,
            nextPageIndex: 'next_cursor',
          ),
        ],
      );

      blocTest<PostBloc, PostState>(
        'emits state with failure status '
        'when repository get future emits error',
        setUp: () {
          when(
            () => repository.fetchPosts(pageIndex: '', itemsPerPage: 10),
          ).thenAnswer((_) => Future.error(Exception('oops')));
        },
        build: buildBloc,
        act: (bloc) => bloc.add(PostFetched()),
        expect: () => [
          const PostState(status: PostStatus.initial),
          const PostState(status: PostStatus.failure),
        ],
      );

      blocTest<PostBloc, PostState>(
        'emits repository never call fetchPosts '
        'when state with loading status ',
        build: buildBloc,
        act: (bloc) => {bloc.add(PostFetched()), bloc.emit(const PostState().copyWith(status: PostStatus.loading))},
        verify: (bloc) {
          verifyNever(() => repository.fetchPosts(pageIndex: '', itemsPerPage: 10));
        },
      );

      blocTest<PostBloc, PostState>(
        'emits repository never call fetchPosts '
        'when hasNextPage is false',
        build: buildBloc,
        act: (bloc) => {bloc.add(PostFetched()), bloc.emit(const PostState().copyWith(hasNextPage: false))},
        verify: (bloc) {
          verifyNever(() => repository.fetchPosts(pageIndex: '', itemsPerPage: 10));
        },
      );
    });
  });
}
