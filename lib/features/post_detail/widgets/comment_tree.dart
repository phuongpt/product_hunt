import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/constants.dart';

class CommentTree extends StatelessWidget {
  const CommentTree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMaxPadding, horizontal: 0),
      child: Container(
        child: CommentTreeWidget<Comment, Comment>(
          Comment(avatar: 'null', userName: 'null', content: 'felangel made felangel/cubit_and_beyond public '),
          [
            Comment(avatar: 'null', userName: 'null', content: 'A Dart template generator which helps teams'),
            Comment(
                avatar: 'null',
                userName: 'null',
                content: 'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
            Comment(avatar: 'null', userName: 'null', content: 'A Dart template generator which helps teams'),
            Comment(avatar: 'null', userName: 'null', content: 'A Dart template generator which helps teams generator which helps teams '),
          ],
          treeThemeData: TreeThemeData(lineColor: Colors.green[500]!, lineWidth: 3),
          avatarRoot: (context, data) => const PreferredSize(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/avatar_2.png'),
            ),
            preferredSize: Size.fromRadius(18),
          ),
          avatarChild: (context, data) => const PreferredSize(
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/avatar_1.png'),
            ),
            preferredSize: Size.fromRadius(12),
          ),
          contentChild: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'dangngocduc',
                        style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Like'),
                        const SizedBox(
                          width: 24,
                        ),
                        const Text('Reply'),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          contentRoot: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'dangngocduc',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Like'),
                        const SizedBox(
                          width: 24,
                        ),
                        const Text('Reply'),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
