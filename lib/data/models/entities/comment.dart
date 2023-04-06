import 'package:product_hunt/data/models/entities/entities.dart';

class Comment {
  Comment({
    required this.id,
    required this.body,
    required this.createdAt,
    this.parentCommentId,
    required this.userId,
    required this.subjectId,
    required this.childCommentsCount,
    required this.url,
    required this.postId,
    required this.subjectType,
    required this.sticky,
    required this.votes,
    required this.user,
    required this.childComments,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    body = json['body'] as String;
    createdAt = DateTime.parse(json['created_at'] as String);
    parentCommentId = json['parentCommentId'] as String?;
    userId = json['user_id'] as String;
    subjectId = json['subject_id'] as String;
    childCommentsCount = json['child_comments_count'] as String;
    url = json['url'] as String;
    subjectType = json['subject_type'] as String;
    sticky = json['sticky'] as bool;
    votes = json['votes'] as String;
    user = User.fromJson(json['user'] as Map<String, dynamic>);
    childComments = List.from(json['child_comments'] as Iterable).map((e) => Comment.fromJson(e as Map<String, dynamic>)).toList();
  }
  late final String id;
  late final String body;
  late final DateTime createdAt;
  late final String? parentCommentId;
  late final String userId;
  late final String subjectId;
  late final String childCommentsCount;
  late final String url;
  late final String postId;
  late final String subjectType;
  late final bool sticky;
  late final String votes;
  late final User user;
  late final List<Comment> childComments;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['created_at'] = createdAt;
    data['parent_comment_id'] = parentCommentId;
    data['user_id'] = userId;
    data['subject_id'] = subjectId;
    data['child_comments_count'] = childCommentsCount;
    data['url'] = url;
    data['post_id'] = postId;
    data['subject_type'] = subjectType;
    data['sticky'] = sticky;
    data['votes'] = votes;
    data['user'] = user.toJson();
    data['child_comments'] = childComments.map((e) => e.toJson()).toList();
    return data;
  }
}
