import 'package:product_hunt/data/caches/caches.dart';

class DataCache {
  final _cache = <DataCacheKey, dynamic>{};

  T? get<T>(DataCacheKey id) {
    if (_cache.containsKey(id)) {
      return _cache[id] as T?;
    } else {
      return null;
    }
  }

  void set(DataCacheKey id, dynamic item) => _cache[id] = item;
}
