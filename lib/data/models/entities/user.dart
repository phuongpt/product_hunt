import 'entities.dart';

class User {
  User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.username,
    this.headline,
    this.twitterUsername,
    this.websiteUrl,
    required this.profileUrl,
    required this.imageUrl,
  });
  late final int id;
  late final String createdAt;
  late final String name;
  late final String username;
  late final String? headline;
  late final String? twitterUsername;
  late final String? websiteUrl;
  late final String profileUrl;
  late final ImageUrl imageUrl;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    username = json['username'];
    headline = null;
    twitterUsername = null;
    websiteUrl = null;
    profileUrl = json['profile_url'];
    imageUrl = ImageUrl.fromJson(json['image_url']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['username'] = username;
    data['headline'] = headline;
    data['twitter_username'] = twitterUsername;
    data['website_url'] = websiteUrl;
    data['profile_url'] = profileUrl;
    data['image_url'] = imageUrl.toJson();
    return data;
  }
}

class CurrentUser {
  CurrentUser({
    required this.votedForPost,
    required this.commentedOnPost,
  });
  late final bool votedForPost;
  late final bool commentedOnPost;

  CurrentUser.fromJson(Map<String, dynamic> json) {
    votedForPost = json['voted_for_post'];
    commentedOnPost = json['commented_on_post'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['voted_for_post'] = votedForPost;
    _data['commented_on_post'] = commentedOnPost;
    return _data;
  }
}
