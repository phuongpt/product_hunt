import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/helpers/datetime_helper.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key, required this.items});
  final List<Comment>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: kMaxPadding),
      child: Column(
        children: [
          if (items != null)
            for (var comment in items!) _CommentItem(comment: comment),
        ],
      ),
    );
  }
}

class _CommentItem extends StatefulWidget {
  const _CommentItem({required this.comment});
  final Comment comment;

  @override
  State<_CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<_CommentItem> {
  bool _expanded = false;

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final randomNames = RandomNames(Zone.us);
    return Container(
      margin: const EdgeInsets.only(bottom: kMinPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styled.widget(
            child: ListTile(
              leading: RandomAvatar(
                DateTime.now().toIso8601String(),
                height: 30.sp,
                width: 30.sp,
              ),
              title: Text(randomNames.fullName(), style: TextStyles.defaultStyle.bold),
              subtitle: Styled.widget(
                child: Text(
                  DateTimeHelper.timeFromNow(widget.comment.createdAt),
                  style: TextStyles.defaultStyle.fontCaption.subTitleColor,
                  maxLines: 2,
                ),
              ).padding(top: kMinPadding),
            ),
          ).padding(vertical: 0).backgroundColor(ColorPalette.backgroundColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.comment.body,
              style: TextStyles.defaultStyle,
            ),
          ),
          if (widget.comment.replies.isNotEmpty)
            Column(
              children: [
                if (_expanded)
                  for (var childComment in widget.comment.replies)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
                      child: _CommentItem(comment: childComment),
                    ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () => {},
                      child: Text(
                        '${widget.comment.votesCount} votes',
                        style: TextStyles.defaultStyle.subTitleColor,
                      ),
                    ),
                    TextButton(
                      onPressed: _toggleExpansion,
                      child: Text(
                        _expanded ? 'Hide replies' : '${widget.comment.childCommentsCount} replies',
                        style: TextStyles.defaultStyle.subTitleColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
