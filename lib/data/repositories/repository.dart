import 'dart:async';

import 'package:product_hunt/core/extensions/iterable_extension.dart';
import 'package:product_hunt/data/apis/api_client.dart';
import 'package:product_hunt/data/caches/caches.dart';
import 'package:product_hunt/data/models/models.dart';

class Repository {
  Repository({ApiClient? client, DataCache? cache})
      : _client = client ?? ApiClient.create(),
        _cache = cache ?? DataCache();

  final ApiClient _client;
  final DataCache _cache;

  Future<List<Post>> fetchPosts() async {
    final result = await _client.fetchPosts();
    final posts = result.posts;
    _cache.set('posts', posts);
    return posts;
  }

  Future<Post?> fetchPost(String postId) async {
    final cachedResult = _cache.get('posts');
    if (cachedResult != null) {
      final posts = cachedResult as List<Post>;
      final post = posts.firstWhereOrNull((post) => post.id == postId && post.comments != null);
      if (post != null) {
        return post;
      }
    }

    final result = await _client.fetchPost(postId);
    return result.post;
  }

  Future<FetchTopicsResult> fetchTopics() async {
    final result = await _client.fetchTopics();
    return result;
  }
}
