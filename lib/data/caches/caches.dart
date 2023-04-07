enum DataCacheKey { post, topic }

class DataCache {
  final _cache = <DataCacheKey, dynamic>{};

  dynamic get(DataCacheKey id) => _cache[id];

  void set(DataCacheKey id, dynamic item) => _cache[id] = item;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
