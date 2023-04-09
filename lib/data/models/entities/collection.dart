// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:product_hunt/data/models/models.dart';

class Collection {
  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    followersCount = json['followersCount'] != null ? json['followersCount'] as int : 0;
    coverImage = json['coverImage'] != null ? json['coverImage'] as String : '';
    description = json['description'] != null ? json['description'] as String : '';
    tagline = json['tagline'] != null ? json['tagline'] as String : '';
    isFollowing = json['isFollowing'] != null ? json['isFollowing'] as bool : false;
    posts = json['posts'] != null
        ? List.from(json['posts']['edges'] as Iterable<dynamic>).map((e) => Post.fromJson(e['node'] as Map<String, dynamic>)).toList()
        : null;
    followersCountString = displayFollowerCount(followersCount);
  }
  late final String id;
  late final String name;
  late final int followersCount;
  late final String followersCountString;
  late final bool isFollowing;
  late final String coverImage;
  late final String description;
  late final String tagline;
  late final List<Post>? posts;

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
