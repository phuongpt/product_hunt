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

  //Posts
  Future<FetchPostsResult> fetchPosts({required String pageIndex, required int itemsPerPage}) async {
    final result = await _client.fetchPosts(pageIndex, itemsPerPage);
    final posts = result.posts;
    _cache.set(DataCacheKey.post, [...posts, ...?_cache.get(DataCacheKey.post) as List<Post>?]);
    return result;
  }

  Future<Post?> fetchPostDetail({required String postId, required bool refresh}) async {
    if (refresh) {
      final result = await _client.fetchPostDetail(postId);
      return result.post;
    }

    final cachedResult = _cache.get(DataCacheKey.post);
    if (cachedResult != null) {
      final posts = cachedResult as List<Post>;
      return posts.firstWhereOrNull((post) => post.id == postId);
    }

    return null;
  }

  //Topics
  Future<FetchTopicsResult> getTrendingTopics() async {
    final result = await _client.getTrendingTopics();
    final topics = result.topics;
    _cache.set(DataCacheKey.topic, [...topics, ...?_cache.get(DataCacheKey.topic) as List<Topic>?]);
    return result;
  }

  Future<FetchTopicsResult> getPopularTopics() async {
    final result = await _client.getPopularTopics();
    final topics = result.topics;
    _cache.set(DataCacheKey.topic, [...topics, ...?_cache.get(DataCacheKey.topic) as List<Topic>?]);
    return result;
  }

  Future<void> updateFollowingTopic({required String topicId, required bool follow}) async {
    await _client.updateFollowingTopic(topicId: topicId, follow: follow);
  }
}
