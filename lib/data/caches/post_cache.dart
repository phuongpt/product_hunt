import '../models/result/result.dart';

class PostCache {
  final _cache = <String, FetchPostsResult>{};

  FetchPostsResult? get(String term) => _cache[term];

  void set(String term, FetchPostsResult result) => _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
