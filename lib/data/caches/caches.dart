class DataCache {
  final _cache = <String, dynamic>{};

  dynamic get(String id) => _cache[id];

  void set(String id, dynamic item) => _cache[id] = item;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
