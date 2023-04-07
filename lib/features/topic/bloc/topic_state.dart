part of 'topic_bloc.dart';

enum TopicStatus { initial, success, failure }

class TopicState extends Equatable {
  const TopicState({
    this.trendingStatus = TopicStatus.initial,
    this.trendingTopics = const <Topic>[],
    this.popularStatus = TopicStatus.initial,
    this.popularTopics = const <Topic>[],
    this.followings = const {},
  });

  final TopicStatus trendingStatus;
  final List<Topic> trendingTopics;
  final TopicStatus popularStatus;
  final List<Topic> popularTopics;
  final Map<String, bool> followings;

  TopicState copyWith({
    TopicStatus? trendingStatus,
    List<Topic>? trendingTopics,
    TopicStatus? popularStatus,
    List<Topic>? popularTopics,
    Map<String, bool>? followings,
  }) {
    return TopicState(
      trendingStatus: trendingStatus ?? this.trendingStatus,
      trendingTopics: trendingTopics ?? this.trendingTopics,
      popularStatus: popularStatus ?? this.popularStatus,
      popularTopics: popularTopics ?? this.popularTopics,
      followings: followings ?? this.followings,
    );
  }

  TopicState updateFollowings() {
    return TopicState(
      trendingStatus: trendingStatus,
      trendingTopics: trendingTopics,
      popularStatus: popularStatus,
      popularTopics: popularTopics,
      followings: _getCurrentFollowing(),
    );
  }

  Map<String, bool> _getCurrentFollowing() {
    final data = <String, bool>{};
    for (final item in trendingTopics) {
      data[item.id] = item.isFollowing;
    }
    for (final item in popularTopics) {
      data[item.id] = item.isFollowing;
    }
    return data;
  }

  TopicState updateFollow(Topic item) {
    return copyWith(followings: {...followings, item.id: !followings[item.id]!});
  }

  @override
  List<Object> get props => [trendingStatus, popularStatus, followings];
}
