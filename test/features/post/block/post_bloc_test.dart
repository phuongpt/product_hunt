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
    nextPageIndex: '',
  );

  group('PostBloc', () {
    late Repository repository;

    setUp(() {
      repository = MockRepository();
      // when(repository.fetchPosts(pageIndex: '', itemsPerPage: 10)).thenAnswer((_) => const Stream.empty());
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
      // blocTest<PostBloc, PostState>(
      //   'starts listening to repository get future',
      //   build: buildBloc,
      //   act: (bloc) => bloc.add(PostFetched()),
      //   verify: (bloc) {
      //     verify(() => repository.fetchPosts(pageIndex: '', itemsPerPage: 10)).called(1);
      //   },
      // );

      blocTest<PostBloc, PostState>(
        'emits state with updated status, items, hasNextPage, nextPageIndex'
        'when repository get stream emits fetchPosts',
        setUp: () {
          when(
            () => repository.fetchPosts(pageIndex: '', itemsPerPage: 10),
          ).thenAnswer((_) => Future.value(data));
        },
        build: buildBloc,
        act: (bloc) => bloc.add(PostFetched()),
        expect: () => [
          const PostState(
            status: PostStatus.initial,
            items: [],
            hasNextPage: true,
            nextPageIndex: '',
          ),
          const PostState(
            status: PostStatus.success,
            items: [],
            hasNextPage: true,
            nextPageIndex: '',
          ),
        ],
      );

      // blocTest<PostBloc, PostState>(
      //   'emits state with failure status '
      //   'when repository get stream emits error',
      //   setUp: () {
      //     when(
      //       () => repository.get(),
      //     ).thenAnswer((_) => Stream.error(Exception('oops')));
      //   },
      //   build: buildBloc,
      //   act: (bloc) => bloc.add(const StatsSubscriptionRequested()),
      //   expect: () => [
      //     const PostState(status: StatsStatus.loading),
      //     const PostState(status: StatsStatus.failure),
      //   ],
      // );
    });
  });
}
