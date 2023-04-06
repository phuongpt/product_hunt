import 'package:product_hunt/data/models/models.dart';

class FetchPostResult {
  FetchPostResult({required this.post});

  FetchPostResult.fromJson(Map<String, dynamic>? json) {
    if (json?['post'] != null) {
      final rawPost = json?['post'] as Map<String, dynamic>;
      final comments = rawPost?['comments']?['edges'] as Iterable<dynamic>;
      post = Post.fromJson(<String, dynamic>{...rawPost, 'comments': comments});
    }
  }

  late final Post? post;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post?.toJson();
    }
    return data;
  }
}
