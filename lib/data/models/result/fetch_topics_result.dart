import 'package:product_hunt/data/models/models.dart';

class FetchTopicsResult {
  FetchTopicsResult({
    required this.topics,
  });

  FetchTopicsResult.fromJson(Map<String, dynamic> json) {
    if (json['topics'] != null) {
      topics = List.from(json['topics'] as Iterable).map((e) => Topic.fromJson(e as Map<String, dynamic>)).toList();
    }
  }
  late final List<Topic>? topics;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (topics != null) {
      data['topics'] = topics!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
