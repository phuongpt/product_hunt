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

  Future<FetchPostsResult> fetchPosts({required String pageIndex, required int itemsPerPage}) async {
    final result = await _client.fetchPosts(pageIndex, itemsPerPage);
    final posts = result.posts;
    _cache.set('posts', [...posts, ...?_cache.get('posts') as List<Post>?]);
    return result;
  }

  Future<Post?> fetchPost({required String postId, required bool refresh}) async {
    if (refresh) {
      final result = await _client.fetchPost(postId);
      return result.post;
    }

    final cachedResult = _cache.get('posts');
    if (cachedResult != null) {
      final posts = cachedResult as List<Post>;
      return posts.firstWhereOrNull((post) => post.id == postId);
    }

    return null;
  }

  Future<FetchTopicsResult> fetchTopics() async {
    final result = await _client.fetchTopics();
    return result;
  }
}
