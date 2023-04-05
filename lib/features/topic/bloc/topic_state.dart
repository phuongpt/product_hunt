part of 'topic_bloc.dart';

abstract class TopicState extends Equatable {
  const TopicState();
  
  @override
  List<Object> get props => [];
}

class TopicInitial extends TopicState {}
