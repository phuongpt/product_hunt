// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import 'package:product_hunt/data/apis/api_client.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:test/test.dart';

import '../../fake_data/fake_data.dart';

class MockApiClient extends Mock implements ApiClient {}

class FakeFetchPostsResult extends Fake implements FetchPostsResult {}

class FakeFetchPostDetailResult extends Fake implements FetchPostDetailResult {}

void main() {
  group('PostRepository', () {
    late ApiClient client;

    final posts = [
      FakePost.generate(),
    ];

    final fetchPostsResult = FetchPostsResult(posts: posts);
    final fetchPostDetailResult = FetchPostDetailResult(post: posts[0]);

    setUpAll(() {
      registerFallbackValue(FakeFetchPostsResult());
      registerFallbackValue(FakeFetchPostDetailResult());
    });

    setUp(() {
      client = MockApiClient();
      when(() => client.fetchPosts(pageIndex: '', itemsPerPage: 10)).thenAnswer((_) => Future.value(fetchPostsResult));
      when(() => client.fetchPostsByTopic(topicSlug: '', pageIndex: '', itemsPerPage: 10)).thenAnswer((_) => Future.value(fetchPostsResult));
      when(() => client.fetchPostDetail('')).thenAnswer((_) => Future.value(fetchPostDetailResult));
    });

    Repository createSubject() => Repository(client: client);

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('Post', () {
      test('fetchPosts returns fulure of posts result', () async {
        expect(
          await createSubject().fetchPosts(pageIndex: '', itemsPerPage: 10),
          fetchPostsResult,
        );
      });

      test('fetchPostsByTopic returns fulure of posts result', () async {
        expect(
          await createSubject().fetchPostsByTopic(topicSlug: '', pageIndex: '', itemsPerPage: 10),
          fetchPostsResult,
        );
      });

      test('fetchPostDetail returns fulure of post result', () async {
        expect(
          await createSubject().fetchPostDetail(slug: '', refresh: true),
          fetchPostDetailResult.post,
        );
      });
    });
  });
}
