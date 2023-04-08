part of 'topic_search_bloc.dart';

enum TopicSearchStatus { empty, loading, success, failure }

class TopicSearchState extends Equatable {
  const TopicSearchState({
    this.status = TopicSearchStatus.empty,
    this.items = const <Topic>[],
    this.hasNextPage = true,
    this.nextPageIndex = '',
    this.itemsPerPage = 10,
    this.searchTerm = '',
  });

  final TopicSearchStatus status;
  final List<Topic> items;
  final bool hasNextPage;
  final String nextPageIndex;
  final int itemsPerPage;
  final String searchTerm;

  TopicSearchState copyWith({
    TopicSearchStatus? status,
    List<Topic>? items,
    bool? hasNextPage,
    String? nextPageIndex,
    int? itemsPerPage,
    String? searchTerm,
  }) {
    return TopicSearchState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      nextPageIndex: nextPageIndex ?? this.nextPageIndex,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() {
    return '''TopicSearchState {searchTerm: $searchTerm, status: $status, items: ${items.length}, hasNextPage: $hasNextPage, nextPageIndex: $nextPageIndex, itemsPerPage: $itemsPerPage}''';
  }

  @override
  List<Object> get props => [status, hasNextPage, nextPageIndex];
}
