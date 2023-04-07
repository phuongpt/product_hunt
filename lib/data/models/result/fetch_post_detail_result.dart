import 'package:product_hunt/data/models/models.dart';

class FetchPostDetailResult {
  FetchPostDetailResult({required this.post});

  FetchPostDetailResult.fromJson(Map<String, dynamic>? json) {
    if (json?['post'] != null) {
      post = Post.fromJson(json?['post'] as Map<String, dynamic>);
    }
  }

  late final Post? post;
}
