import 'dart:async';

import '../apis/api_client.dart';
import '../caches/caches.dart';
import '../models/models.dart';

class PostRepository {
  const PostRepository(this.cache, this.client);

  final PostCache cache;
  final ApiClient client;

  Future<FetchPostsResult> fetchPosts() async {
    final result = await client.fetchPosts();
    return result;
  }

  Future<FetchPostResult> fetchPost(String postId) async {
    final result = await client.fetchPost(postId);
    return result;
  }

  Future<FetchTopicsResult> fetchTopics() async {
    final result = await client.fetchTopics();
    return result;
  }
}
