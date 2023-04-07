// ignore_for_file: avoid_bool_literals_in_conditional_expressions

class Topic {
  Topic({
    required this.id,
    required this.name,
    required this.slug,
  });

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    slug = json['slug'] as String;
    followersCount = json['followersCount'] != null ? json['followersCount'] as int : 0;
    postsCount = json['postsCount'] != null ? json['postsCount'] as int : 0;
    image = json['image'] != null ? json['image'] as String : '';
    description = json['description'] != null ? json['description'] as String : '';
    isFollowing = json['isFollowing'] != null ? json['isFollowing'] as bool : false;
    followersCountString = displayFollowerCount(followersCount);
  }
  late final String id;
  late final String name;
  late final String slug;
  late final int followersCount;
  late final String followersCountString;
  late final bool isFollowing;
  late final int postsCount;
  late final String image;
  late final String description;

  String displayFollowerCount(int followersCount) {
    var followerAsString = '';
    if (followersCount >= 1000) {
      followerAsString = '${(followersCount / 1000).toStringAsFixed(0)}K Followers';
    } else {
      followerAsString = '${followersCount.toStringAsFixed(0)} Followers';
    }
    return followerAsString;
  }
}
