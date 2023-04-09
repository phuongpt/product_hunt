part of 'collection_detail_cubit.dart';

enum Status { loading, success, failure, update }

class CollectionDetailState extends Equatable {
  const CollectionDetailState._({
    this.status = Status.loading,
    this.item,
  });

  const CollectionDetailState.loading() : this._(status: Status.loading);

  const CollectionDetailState.success(Collection item) : this._(status: Status.success, item: item);

  const CollectionDetailState.update(Collection item) : this._(status: Status.update, item: item);

  const CollectionDetailState.failure() : this._(status: Status.failure);

  final Status status;
  final Collection? item;

  @override
  String toString() {
    return '''CollectionDetailState { status: $status, posts: ${item?.posts?.length}}''';
  }

  @override
  List<Object> get props => [status];
}
