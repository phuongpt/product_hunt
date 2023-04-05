import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'topic_event.dart';
part 'topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicInitial()) {
    on<TopicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
