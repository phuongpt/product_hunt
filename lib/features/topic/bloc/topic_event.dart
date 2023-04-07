part of 'topic_bloc.dart';

abstract class TopicEvent extends Equatable {
  const TopicEvent();

  @override
  List<Object> get props => [];
}

class TopicFetched extends TopicEvent {}

class TopicFollowUpdated extends TopicEvent {
  const TopicFollowUpdated(this.item);

  final Topic item;

  @override
  List<Object> get props => [item];
}
