class Topic {
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
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    description = json['description'];
    followersCount = displayFollowerCount(json['followers_count']);
    postsCount = json['posts_count'];
    updatedAt = json['updated_at'];
    image = json['image'];
    trending = json['trending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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

  displayFollowerCount(followers) {
    String followerAsString = "";
    if (followers >= 1000) {
      followerAsString = (followers / 1000).toStringAsFixed(1) + "K Followers";
    } else {
      followerAsString = followers.toStringAsFixed(1) + " Followers";
    }
    return followerAsString;
  }
}
