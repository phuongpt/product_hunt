part of 'topic_detail_post_bloc.dart';

abstract class TopicDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TopicDetailPostFetched extends TopicDetailEvent {
  TopicDetailPostFetched({required this.topicSlug});

  final String topicSlug;

  @override
  List<Object> get props => [topicSlug];

  @override
  String toString() => 'SearchTermChanged { topicSlug: $topicSlug }';
}
