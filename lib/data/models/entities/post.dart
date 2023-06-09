import 'package:product_hunt/data/models/entities/entities.dart';

class Post {
  Post({
    required this.id,
    required this.name,
    required this.tagline,
    required this.slug,
    required this.votesCount,
    required this.thumbnail,
    required this.description,
    required this.topics,
    required this.commentsCount,
    required this.reviewsCount,
    required this.user,
    this.featuredAt,
    this.featured,
    this.url,
    this.website,
    this.comments,
    required this.media,
  });
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    tagline = json['tagline'] as String;
    slug = json['slug'] as String;
    votesCount = json['votesCount'] as int;
    featuredAt = json['featuredAt'] != null ? DateTime.parse(json['featuredAt'] as String) : null;
    thumbnail = Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>);
    reviewsCount = json['reviewsCount'] as int;
    commentsCount = json['commentsCount'] as int;
    user = User.fromJson({});
    media = json['media'] != null ? List.from(json['media'] as Iterable<dynamic>).map((e) => Media.fromJson(e as Map<String, dynamic>)).toList() : [];
    topics = List.from(json['topics']['edges'] as Iterable<dynamic>).map((e) => Topic.fromJson(e['node'] as Map<String, dynamic>)).toList();

    url = json['url'] as String?;
    website = json['website'] as String?;
    featured = json['featured'] as bool?;
    comments = json['comments'] != null
        ? List.from(json['comments']['edges'] as Iterable<dynamic>).map((e) => Comment.fromJson(e['node'] as Map<String, dynamic>)).toList()
        : null;
    description = json['description'] as String? ?? json['tagline'] as String;
  }
  late final String id;
  late final String name;
  late final String tagline;
  late final String slug;
  late final int votesCount;
  late final DateTime? featuredAt;
  late final Thumbnail thumbnail;
  late final String description;
  late final List<Topic> topics;
  late final int commentsCount;
  late final int reviewsCount;
  late final User user;

  late final bool? featured;
  late final String? url;
  late final String? website;
  late final List<Comment>? comments;
  late final List<Media> media;
}
