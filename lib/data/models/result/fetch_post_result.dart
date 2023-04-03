import '../models.dart';

class FetchPostResult {
  FetchPostResult({required this.post});

  late final Post? post;

  FetchPostResult.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post?.toJson();
    }
    return data;
  }
}
