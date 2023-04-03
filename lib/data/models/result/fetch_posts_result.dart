import '../models.dart';

class FetchPostsResult {
  FetchPostsResult({
    required this.posts,
  });
  late final List<Post>? posts;

  FetchPostsResult.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = List.from(json['posts']).map((e) => Post.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
