part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.items = const <Post>[],
    this.hasMore = true,
  });

  final PostStatus status;
  final List<Post> items;
  final bool hasMore;

  PostState copyWith({
    PostStatus? status,
    List<Post>? items,
    bool? hasMore,
  }) {
    return PostState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasMore: $hasMore, items: ${items.length} }''';
  }

  @override
  List<Object> get props => [status, items, hasMore];
}
