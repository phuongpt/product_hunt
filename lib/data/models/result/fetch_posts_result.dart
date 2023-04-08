// ignore_for_file: avoid_dynamic_calls, inference_failure_on_instance_creation

import 'package:product_hunt/data/models/models.dart';

class FetchPostsResult {
  FetchPostsResult.fromJson(Map<String, dynamic>? json) {
    if (json?['posts']['edges'] != null) {
      posts = List.from(json?['posts']['edges'] as Iterable).map((e) => Post.fromJson(e['node'] as Map<String, dynamic>)).toList();
      hasNextPage = json?['posts']['pageInfo']['hasNextPage'] as bool;
      nextPageIndex = json?['posts']['pageInfo']['endCursor'] as String?;
    } else {
      posts = [];
    }
  }
  late final List<Post> posts;
  late final bool hasNextPage;
  late final String? nextPageIndex;
}
