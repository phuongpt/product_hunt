part of 'post_detail_cubit.dart';

enum Status { loading, success, failure, update }

class PostDetailState extends Equatable {
  const PostDetailState._({
    this.status = Status.loading,
    this.item,
  });

  const PostDetailState.loading() : this._(status: Status.loading);

  const PostDetailState.success(Post item) : this._(status: Status.success, item: item);

  const PostDetailState.update(Post item) : this._(status: Status.update, item: item);

  const PostDetailState.failure() : this._(status: Status.failure);

  final Status status;
  final Post? item;

  @override
  String toString() {
    return '''PostDetailState { status: $status, comments: ${item?.comments?.length}}''';
  }

  @override
  List<Object> get props => [status];
}
