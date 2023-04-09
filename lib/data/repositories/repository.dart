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
    final result = await _client.fetchPosts(pageIndex: pageIndex, itemsPerPage: itemsPerPage);
    final posts = result.posts;

    _cache.set(DataCacheKey.post, [...posts, ...?_cache.get<List<Post>>(DataCacheKey.post)]);

    return result;
  }

  Future<FetchPostsResult> fetchPostsByTopic({required String topicSlug, required String pageIndex, required int itemsPerPage}) async {
    final result = await _client.fetchPostsByTopic(topicSlug: topicSlug, pageIndex: pageIndex, itemsPerPage: itemsPerPage);
    final posts = result.posts;

    _cache.set(DataCacheKey.post, [...posts, ...?_cache.get<List<Post>>(DataCacheKey.post)]);

    return result;
  }

  Future<Post?> fetchPostDetail({required String slug, required bool refresh}) async {
    if (!refresh) {
      final cache = _cache.get<List<Post>>(DataCacheKey.post)?.firstWhereOrNull((post) => post.slug == slug);
      if (cache != null) {
        return cache;
      }
    }
    final result = await _client.fetchPostDetail(slug);
    return result.post;
  }

  //Topics
  Future<FetchTopicsResult> getTrendingTopics() async {
    final result = await _client.getTrendingTopics();
    final topics = result.topics;
    _cache.set(DataCacheKey.topic, [...topics, ...?_cache.get<List<Topic>>(DataCacheKey.topic)]);
    return result;
  }

  Future<FetchTopicsResult> getPopularTopics() async {
    final result = await _client.getPopularTopics();
    final topics = result.topics;

    _cache.set(DataCacheKey.topic, [...topics, ...?_cache.get<List<Topic>>(DataCacheKey.topic)]);

    return result;
  }

  Future<void> updateFollowingTopic({required String topicId, required bool follow}) async {
    await _client.updateFollowingTopic(topicId: topicId, follow: follow);
  }

  Future<SearchTopicsResult> searchTopics({required String searchTerm, required String pageIndex, required int itemsPerPage}) async {
    final result = await _client.searchTopics(searchTerm: searchTerm, pageIndex: pageIndex, itemsPerPage: itemsPerPage);
    final topics = result.topics;

    _cache.set(DataCacheKey.topic, [...topics, ...?_cache.get<List<Topic>>(DataCacheKey.topic)]);

    return result;
  }

  Future<Topic?> fetchTopicDetail({required String slug, required bool refresh}) async {
    if (!refresh) {
      final cache = _cache.get<List<Topic>>(DataCacheKey.topic)?.firstWhereOrNull((topic) => topic.slug == slug);
      if (cache != null) {
        return cache;
      }
    }

    final result = await _client.fetchTopicDetail(slug);
    return result.post;
  }

  //Collections
  Future<FetchCollectionsResult> fetchCollections({required String pageIndex, required int itemsPerPage}) async {
    final result = await _client.fetchCollections(pageIndex: pageIndex, itemsPerPage: itemsPerPage);
    final collections = result.collections;

    _cache.set(DataCacheKey.collection, [...collections, ...?_cache.get<List<Collection>>(DataCacheKey.collection)]);

    return result;
  }

  Future<Collection?> fetchCollectionDetail({required String id, required bool refresh}) async {
    if (!refresh) {
      final cache = _cache.get<List<Collection>>(DataCacheKey.collection)?.firstWhereOrNull((collection) => collection.id == id);
      if (cache != null) {
        return cache;
      }
    }

    final result = await _client.fetchCollectionDetail(id);
    return result.collection;
  }

  Future<void> updateFollowingCollection({required String collectionId, required bool follow}) async {
    await _client.updateFollowingCollection(collectionId: collectionId, follow: follow);
  }
}
