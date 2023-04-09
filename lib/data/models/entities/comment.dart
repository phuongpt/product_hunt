import 'package:product_hunt/data/models/entities/entities.dart';

class Comment {
  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    body = json['body'] as String;
    createdAt = DateTime.parse(json['createdAt'] as String);
    votesCount = json['votesCount'] as int;
    user = User.fromJson({});
    if (json['replies'] != null) {
      repliesCount = json['replies']?['totalCount'] as int;
      replies = List.from(json['replies']['edges'] as Iterable<dynamic>).map((e) => Comment.fromJson(e['node'] as Map<String, dynamic>)).toList();
    } else {
      repliesCount = 0;
      replies = [];
    }
  }
  late final String id;
  late final String body;
  late final DateTime createdAt;
  late final int repliesCount;
  late final int votesCount;
  late final User user;
  late final List<Comment> replies;
}
