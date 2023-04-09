part of 'collection_bloc.dart';

enum CollectionStatus { initial, loading, success, failure }

class CollectionState extends Equatable {
  const CollectionState({
    this.status = CollectionStatus.initial,
    this.items = const <Collection>[],
    this.hasNextPage = true,
    this.nextPageIndex = '',
    this.itemsPerPage = 10,
    this.followings = const {},
  });

  final CollectionStatus status;
  final List<Collection> items;
  final bool hasNextPage;
  final String nextPageIndex;
  final int itemsPerPage;
  final Map<String, bool> followings;

  CollectionState copyWith({
    CollectionStatus? status,
    List<Collection>? items,
    bool? hasNextPage,
    String? nextPageIndex,
    int? itemsPerPage,
    Map<String, bool>? followings,
  }) {
    return CollectionState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      nextPageIndex: nextPageIndex ?? this.nextPageIndex,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      followings: followings ?? this.followings,
    );
  }

  CollectionState updateFollowings() {
    return CollectionState(
      status: status,
      items: items,
      hasNextPage: hasNextPage,
      nextPageIndex: nextPageIndex,
      itemsPerPage: itemsPerPage,
      followings: _getCurrentFollowing(),
    );
  }

  Map<String, bool> _getCurrentFollowing() {
    final data = <String, bool>{};
    for (final item in items) {
      data[item.id] = item.isFollowing;
    }
    return data;
  }

  CollectionState updateFollow(Collection item) {
    return copyWith(followings: {...followings, item.id: !followings[item.id]!});
  }

  @override
  String toString() {
    return '''CollectionState { status: $status, items: ${items.length}, hasNextPage: $hasNextPage, nextPageIndex: $nextPageIndex, itemsPerPage: $itemsPerPage, followings: $followings}''';
  }

  @override
  List<Object> get props => [status, hasNextPage, nextPageIndex, followings];
}
