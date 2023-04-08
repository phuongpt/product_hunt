part of 'topic_detail_cubit.dart';

enum Status { loading, success, failure, update }

class TopicDetailState extends Equatable {
  const TopicDetailState._({
    this.status = Status.loading,
    this.item,
  });

  const TopicDetailState.loading() : this._(status: Status.loading);

  const TopicDetailState.success(Topic item) : this._(status: Status.success, item: item);

  const TopicDetailState.update(Topic item) : this._(status: Status.update, item: item);

  const TopicDetailState.failure() : this._(status: Status.failure);

  final Status status;
  final Topic? item;

  @override
  String toString() {
    return '''TopicDetailState { status: $status}''';
  }

  @override
  List<Object> get props => [status];
}
