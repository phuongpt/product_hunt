import 'package:product_hunt/data/models/entities/entities.dart';

class Post {
  Post({
    required this.commentsCount,
    required this.id,
    required this.name,
    required this.productState,
    required this.tagline,
    required this.slug,
    required this.votesCount,
    required this.day,
    this.categoryId,
    required this.createdAt,
    required this.currentUser,
    required this.discussionUrl,
    this.exclusive,
    required this.featured,
    required this.iosFeaturedAt,
    required this.makerInside,
    required this.platforms,
    required this.redirectUrl,
    required this.screenshots,
    required this.thumbnail,
    required this.topics,
    required this.user,
    required this.description,
    required this.media,
    required this.installLinks,
    required this.comments,
    required this.badges,
    this.reviewsCount,
  });

  Post.fromJson(Map<String, dynamic> json) {
    commentsCount = json['comments_count'] as int;
    id = json['id'] as int;
    name = json['name'] as String;
    productState = json['product_state'] as String;
    tagline = json['tagline'] as String;
    slug = json['slug'] as String;
    votesCount = json['votes_count'] as int;
    day = DateTime.parse(json['day'] as String);
    categoryId = null;
    createdAt = DateTime.parse(json['created_at'] as String);
    currentUser = CurrentUser.fromJson(json['current_user'] as Map<String, dynamic>);
    discussionUrl = json['discussion_url'] as String;
    exclusive = null;
    featured = json['featured'] as bool;
    redirectUrl = json['redirect_url'] as String;
    screenshots = Screenshots.fromJson(json['screenshot_url'] as Map<String, dynamic>);
    thumbnail = Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>);
    topics = List.from(json['topics'] as Iterable<dynamic>).map((e) => Topic.fromJson(e as Map<String, dynamic>)).toList();
    user = User.fromJson(json['user'] as Map<String, dynamic>);
    reviewsCount = json['reviewsCount'] as int?;
    media = json['media'] != null ? List.from(json['media'] as Iterable<dynamic>).map((e) => Media.fromJson(e as Map<String, dynamic>)).toList() : [];
    comments =
        json['comments'] != null ? List.from(json['comments'] as Iterable<dynamic>).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList() : [];
    installLinks = json['installLinks'] != null
        ? List.from(json['installLinks'] as Iterable<dynamic>).map((e) => InstallLinks.fromJson(e as Map<String, dynamic>)).toList()
        : [];
    badges = json['badges'] != null ? List.from(json['badges'] as Iterable<dynamic>).map((e) => Badges.fromJson(e as Map<String, dynamic>)).toList() : [];
    description = json['description'] as String? ?? json['tagline'] as String;
  }
  late final int commentsCount;
  late final int id;
  late final String name;
  late final String productState;
  late final String tagline;
  late final String slug;
  late final int votesCount;
  late final DateTime day;
  late final String? categoryId;
  late final DateTime createdAt;
  late final CurrentUser currentUser;
  late final String discussionUrl;
  late final String? exclusive;
  late final bool featured;
  late final bool iosFeaturedAt;
  late final bool makerInside;
  late final List<dynamic> platforms;
  late final String redirectUrl;
  late final Screenshots screenshots;
  late final Thumbnail thumbnail;
  late final List<Topic> topics;
  late final User user;
  late final int? reviewsCount;
  late final List<Badges> badges;
  late final List<Comment> comments;
  late final List<InstallLinks> installLinks;
  late final List<Media> media;
  late final String description;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
