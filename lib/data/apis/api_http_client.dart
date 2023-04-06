import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_hunt/core/constants/keys.dart';
import 'package:product_hunt/data/models/models.dart';

class ApiHttpClient {
  ApiHttpClient({
    http.Client? httpClient,
    this.baseUrl = 'https://api.producthunt.com',
    this.headers = const {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $productHuntToken',
    },
  }) : httpClient = httpClient ?? http.Client();

  late String baseUrl;
  final Map<String, String> headers;
  final http.Client httpClient;

  Future<FetchPostsResult> fetchPosts() async {
    const query = '''
      query {
        posts(order:RANKING,first:5) {
          edges {
            node {
              id
              name
              tagline
              slug
              votesCount
              createdAt
              featuredAt
              thumbnail {
                url
              }
              reviewsCount
              commentsCount
              topics {
                edges {
                  node {
                    name
                    slug
                    id
                  }
                }
              }
              user {
                headline
                id,
                name
              }
              description
              media{
                url
                type
                videoUrl
              }
            }
          }
        }
      }
    ''';

    final body = <String, dynamic>{'query': query};

    final response = await http.post(
      Uri.parse('$baseUrl/v2/api/graphql'),
      headers: headers,
      body: json.encode(body),
    );

    final results = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return FetchPostsResult.fromJson(results['data'] as Map<String, dynamic>);
    } else {
      throw FetchError.fromJson(results);
    }
  }

  Future<FetchPostResult> fetchPost(String postId) async {
    return FetchPostResult(post: null);
  }

  Future<FetchTopicsResult> fetchTopics() async {
    return FetchTopicsResult(topics: []);
  }
}
