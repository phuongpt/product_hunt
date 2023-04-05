import 'package:product_hunt/data/models/models.dart';

class FetchPostResult {
  FetchPostResult({required this.post});

  FetchPostResult.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? Post.fromJson(json['post'] as Map<String, dynamic>) : null;
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
