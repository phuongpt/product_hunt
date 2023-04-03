import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class ApiClient {
  ApiClient({
    http.Client? httpClient,
    this.baseUrl = 'https://api.producthunt.com',
  }) : httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;

  Future<FetchPostsResult> fetchPosts() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/v1/posts/all'));
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return FetchPostsResult.fromJson(results);
    } else {
      throw FetchError.fromJson(results);
    }
  }

  Future<FetchPostResult> fetchPost(String postId) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/v1/posts/$postId'));
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return FetchPostResult.fromJson(results);
    } else {
      throw FetchError.fromJson(results);
    }
  }

  Future<FetchTopicsResult> fetchTopics() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/v1/topics'));
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return FetchTopicsResult.fromJson(results);
    } else {
      throw FetchError.fromJson(results);
    }
  }
}
