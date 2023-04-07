import 'package:product_hunt/data/models/models.dart';

class FetchTopicsResult {
  FetchTopicsResult({
    required this.topics,
  });

  FetchTopicsResult.fromJson(Map<String, dynamic>? json) {
    if (json?['topics'] != null) {
      topics = List.from(json?['topics']['edges'] as Iterable).map((e) => Topic.fromJson(e['node'] as Map<String, dynamic>)).toList();
    } else {
      topics = [];
    }
  }
  late final List<Topic> topics;
}
