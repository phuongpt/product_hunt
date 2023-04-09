part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CollectionFetched extends CollectionEvent {}

class CollectionFollowUpdated extends CollectionEvent {
  CollectionFollowUpdated(this.item);

  final Collection item;

  @override
  List<Object> get props => [item];
}
