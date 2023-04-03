import 'entities.dart';

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

  Post.fromJson(Map<String, dynamic> json) {
    commentsCount = json['comments_count'];
    id = json['id'];
    name = json['name'];
    productState = json['product_state'];
    tagline = json['tagline'];
    slug = json['slug'];
    votesCount = json['votes_count'];
    day = json['day'];
    categoryId = null;
    createdAt = json['created_at'];
    currentUser = CurrentUser.fromJson(json['current_user']);
    discussionUrl = json['discussion_url'];
    exclusive = null;
    featured = json['featured'];
    iosFeaturedAt = json['ios_featured_at'];
    makerInside = json['maker_inside'];
    makers = List.from(json['makers']).map((e) => Makers.fromJson(e)).toList();
    platforms = List.castFrom<dynamic, dynamic>(json['platforms']);
    redirectUrl = json['redirect_url'];
    screenshotUrl = ScreenshotUrl.fromJson(json['screenshot_url']);
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    topics = List.from(json['topics']).map((e) => Topic.fromJson(e)).toList();
    user = User.fromJson(json['user']);
  }

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
