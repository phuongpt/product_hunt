import 'dart:async';

import 'package:product_hunt/data/apis/api_client.dart';
import 'package:product_hunt/data/models/models.dart';

class Repository {
  Repository({ApiClient? client}) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<List<Post>> fetchPosts() async {
    final result = await _client.fetchPosts();
    return result.posts;
  }

  Future<FetchPostResult> fetchPost(String postId) async {
    final result = await _client.fetchPost(postId);
    return result;
  }

  Future<FetchTopicsResult> fetchTopics() async {
    final result = await _client.fetchTopics();
    return result;
  }
}
