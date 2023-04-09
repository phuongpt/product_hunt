import 'package:product_hunt/data/models/models.dart';

class FetchCollectionDetailResult {
  FetchCollectionDetailResult({required this.collection});

  FetchCollectionDetailResult.fromJson(Map<String, dynamic>? json) {
    if (json?['collection'] != null) {
      collection = Collection.fromJson(json?['collection'] as Map<String, dynamic>);
    }
  }

  late final Collection? collection;
}
