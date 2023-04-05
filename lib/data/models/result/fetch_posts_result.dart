import 'package:product_hunt/data/models/models.dart';

class FetchPostsResult {
  FetchPostsResult({
    required this.posts,
  });

  FetchPostsResult.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = List.from(json['posts'] as Iterable).map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    }
  }
  late final List<Post> posts;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['posts'] = posts.map((e) => e.toJson()).toList();
    return data;
  }
}
