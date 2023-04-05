class Topic {
  Topic({
    required this.id,
    required this.name,
    required this.slug,
    this.createdAt,
    this.description,
    this.followersCount,
    this.postsCount,
    this.updatedAt,
    this.image,
    this.trending,
  });

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    slug = json['slug'] as String;
    createdAt = json['created_at'] as String?;
    description = json['description'] as String?;
    followersCount = displayFollowerCount(json['followers_count'] as int?);
    postsCount = json['posts_count'] as int?;
    updatedAt = json['updated_at'] as String?;
    image = json['image'] as String?;
    trending = json['trending'] as bool?;
  }

  late final int id;
  late final String name;
  late final String slug;
  String? createdAt;
  String? description;
  String? followersCount;
  int? postsCount;
  String? updatedAt;
  String? image;
  bool? trending;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['followers_count'] = followersCount;
    data['posts_count'] = postsCount;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['trending'] = trending;
    return data;
  }

  String displayFollowerCount(int? followers) {
    var followerAsString = '';
    if (followers == null) {
      return followerAsString;
    }
    if (followers >= 1000) {
      followerAsString = '${(followers / 1000).toStringAsFixed(1)}K Followers';
    } else {
      followerAsString = '${followers.toStringAsFixed(1)} Followers';
    }
    return followerAsString;
  }
}
