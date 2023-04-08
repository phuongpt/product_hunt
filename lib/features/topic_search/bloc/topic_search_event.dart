part of 'topic_search_bloc.dart';

abstract class TopicSearchEvent extends Equatable {
  const TopicSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTermChanged extends TopicSearchEvent {
  const SearchTermChanged({required this.searchTerm});

  final String searchTerm;

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() => 'SearchTermChanged { text: $searchTerm }';
}

class TopicSearchFetchedMore extends TopicSearchEvent {
  @override
  List<Object> get props => [];
}
