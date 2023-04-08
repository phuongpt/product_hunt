// ignore_for_file: avoid_dynamic_calls, inference_failure_on_instance_creation

import 'package:product_hunt/data/models/models.dart';

class SearchTopicsResult {
  SearchTopicsResult.fromJson(Map<String, dynamic>? json) {
    if (json?['topics']['edges'] != null) {
      topics = List.from(json?['topics']['edges'] as Iterable).map((e) => Topic.fromJson(e['node'] as Map<String, dynamic>)).toList();

      hasNextPage = json?['topics']['pageInfo']['hasNextPage'] as bool;
      nextPageIndex = json?['topics']['pageInfo']['endCursor'] as String?;
    } else {
      topics = [];
    }
  }
  late final List<Topic> topics;
  late final bool hasNextPage;
  late final String? nextPageIndex;
}
