import 'package:product_hunt/data/models/models.dart';

class FetchPostsResult {
  FetchPostsResult({
    required this.posts,
  });

  FetchPostsResult.fromJson(Map<String, dynamic>? json) {
    if (json?['posts']['edges'] != null) {
      posts = List.from(json?['posts']['edges'] as Iterable).map((e) => Post.fromJson(e['node'] as Map<String, dynamic>)).toList();
    }
  }
  late final List<Post> posts;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
