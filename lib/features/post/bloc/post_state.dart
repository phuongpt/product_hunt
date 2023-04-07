part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.items = const <Post>[],
    this.hasNextPage = true,
    this.nextPageIndex = '',
    this.itemsPerPage = 10,
  });

  final PostStatus status;
  final List<Post> items;
  final bool hasNextPage;
  final String nextPageIndex;
  final int itemsPerPage;

  PostState copyWith({
    PostStatus? status,
    List<Post>? items,
    bool? hasNextPage,
    String? nextPageIndex,
    int? itemsPerPage,
  }) {
    return PostState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      nextPageIndex: nextPageIndex ?? this.nextPageIndex,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, items: ${items.length}, hasNextPage: $hasNextPage, nextPageIndex: $nextPageIndex, itemsPerPage: $itemsPerPage}''';
  }

  @override
  List<Object> get props => [status, hasNextPage, nextPageIndex];
}
