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
    required this.makers,
    required this.platforms,
    required this.redirectUrl,
    required this.screenshotUrl,
    required this.thumbnail,
    required this.topics,
    required this.user,
  });

  Post.fromJson(Map<String, dynamic> json) {
    commentsCount = json['comments_count'] as int;
    id = json['id'] as int;
    name = json['name'] as String;
    productState = json['product_state'] as String;
    tagline = json['tagline'] as String;
    slug = json['slug'] as String;
    votesCount = json['votes_count'] as int;
    day = json['day'] as String;
    categoryId = null;
    createdAt = json['created_at'] as String;
    currentUser = CurrentUser.fromJson(json['current_user'] as Map<String, dynamic>);
    discussionUrl = json['discussion_url'] as String;
    exclusive = null;
    featured = json['featured'] as bool;
    redirectUrl = json['redirect_url'] as String;
    screenshotUrl = ScreenshotUrl.fromJson(json['screenshot_url'] as Map<String, dynamic>);
    thumbnail = Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>);
    user = User.fromJson(json['user'] as Map<String, dynamic>);
    // makers = List.from(json['makers'] as Iterable<dynamic>).map((e) => Makers.fromJson(e as Map<String, dynamic>)).toList();
    topics = List.from(json['topics'] as Iterable<dynamic>).map((e) => Topic.fromJson(e as Map<String, dynamic>)).toList();
  }
  late final int commentsCount;
  late final int id;
  late final String name;
  late final String productState;
  late final String tagline;
  late final String slug;
  late final int votesCount;
  late final String day;
  late final String? categoryId;
  late final String createdAt;
  late final CurrentUser currentUser;
  late final String discussionUrl;
  late final String? exclusive;
  late final bool featured;
  late final bool iosFeaturedAt;
  late final bool makerInside;
  late final List<Makers> makers;
  late final List<dynamic> platforms;
  late final String redirectUrl;
  late final ScreenshotUrl screenshotUrl;
  late final Thumbnail thumbnail;
  late final List<Topic> topics;
  late final User user;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['comments_count'] = commentsCount;
    data['id'] = id;
    data['name'] = name;
    data['product_state'] = productState;
    data['tagline'] = tagline;
    data['slug'] = slug;
    data['votes_count'] = votesCount;
    data['day'] = day;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['current_user'] = currentUser.toJson();
    data['discussion_url'] = discussionUrl;
    data['exclusive'] = exclusive;
    data['featured'] = featured;
    data['ios_featured_at'] = iosFeaturedAt;
    data['maker_inside'] = makerInside;
    data['makers'] = makers.map((e) => e.toJson()).toList();
    data['platforms'] = platforms;
    data['redirect_url'] = redirectUrl;
    data['screenshot_url'] = screenshotUrl.toJson();
    data['thumbnail'] = thumbnail.toJson();
    data['topics'] = topics.map((e) => e.toJson()).toList();
    data['user'] = user.toJson();
    return data;
  }
}
