part of 'topic_detail_post_bloc.dart';

enum TopicDetailPostStatus { initial, loading, success, failure }

class TopicDetailPostState extends Equatable {
  const TopicDetailPostState({
    this.status = TopicDetailPostStatus.initial,
    this.items = const <Post>[],
    this.hasNextPage = true,
    this.nextPageIndex = '',
    this.itemsPerPage = 10,
  });

  final TopicDetailPostStatus status;
  final List<Post> items;
  final bool hasNextPage;
  final String nextPageIndex;
  final int itemsPerPage;

  TopicDetailPostState copyWith({
    TopicDetailPostStatus? status,
    List<Post>? items,
    bool? hasNextPage,
    String? nextPageIndex,
    int? itemsPerPage,
  }) {
    return TopicDetailPostState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      nextPageIndex: nextPageIndex ?? this.nextPageIndex,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }

  @override
  String toString() {
    return '''TopicDetailPostState { status: $status, items: ${items.length}, hasNextPage: $hasNextPage, nextPageIndex: $nextPageIndex, itemsPerPage: $itemsPerPage}''';
  }

  @override
  List<Object> get props => [status, hasNextPage, nextPageIndex];
}
