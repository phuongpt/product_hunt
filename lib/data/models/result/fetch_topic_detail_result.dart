import 'package:product_hunt/data/models/models.dart';

class FetchTopicDetailResult {
  FetchTopicDetailResult({required this.post});

  FetchTopicDetailResult.fromJson(Map<String, dynamic>? json) {
    if (json?['topic'] != null) {
      post = Topic.fromJson(json?['topic'] as Map<String, dynamic>);
    }
  }

  late final Topic? post;
}
