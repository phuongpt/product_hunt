import '../models.dart';

class FetchTopicsResult {
  FetchTopicsResult({
    required this.topics,
  });
  late final List<Topic>? topics;

  FetchTopicsResult.fromJson(Map<String, dynamic> json) {
    if (json['topics'] != null) {
      topics = List.from(json['topics']).map((e) => Topic.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (topics != null) {
      data['topics'] = topics!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
