// ignore_for_file: avoid_dynamic_calls, inference_failure_on_instance_creation

import 'package:product_hunt/data/models/models.dart';

class FetchCollectionsResult {
  FetchCollectionsResult.fromJson(Map<String, dynamic>? json) {
    if (json?['collections']['edges'] != null) {
      collections = List.from(json?['collections']['edges'] as Iterable).map((e) => Collection.fromJson(e['node'] as Map<String, dynamic>)).toList();
      hasNextPage = json?['collections']['pageInfo']['hasNextPage'] as bool;
      nextPageIndex = json?['collections']['pageInfo']['endCursor'] as String?;
    } else {
      collections = [];
    }
  }
  late final List<Collection> collections;
  late final bool hasNextPage;
  late final String? nextPageIndex;
}
