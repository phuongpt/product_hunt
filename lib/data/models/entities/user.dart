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
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    createdAt = json['created_at'] as String;
    name = json['name'] as String;
    username = json['username'] as String;
    headline = null;
    twitterUsername = null;
    websiteUrl = null;
    profileUrl = json['profile_url'] as String;
  }
  late final int id;
  late final String createdAt;
  late final String name;
  late final String username;
  late final String? headline;
  late final String? twitterUsername;
  late final String? websiteUrl;
  late final String profileUrl;

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
    return data;
  }
}

class CurrentUser {
  CurrentUser({
    required this.votedForPost,
    required this.commentedOnPost,
  });

  CurrentUser.fromJson(Map<String, dynamic> json) {
    votedForPost = json['voted_for_post'] as bool;
    commentedOnPost = json['commented_on_post'] as bool;
  }
  late final bool votedForPost;
  late final bool commentedOnPost;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['voted_for_post'] = votedForPost;
    data['commented_on_post'] = commentedOnPost;
    return data;
  }
}
