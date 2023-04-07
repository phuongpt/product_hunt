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
            for (var comment in items!) CommentItem(comment: comment),
        ],
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  const CommentItem({super.key, required this.comment});
  final Comment comment;

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    final randomNames = RandomNames(Zone.us);
    return Container(
      margin: const EdgeInsets.only(bottom: kMinPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Gennerate random avatars and names due to API doesn't return properly values
          ListTile(
            leading: RandomAvatar(
              widget.comment.id,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.comment.body,
              style: TextStyles.defaultStyle,
            ),
          ),
          Replies(comment: widget.comment),
        ],
      ),
    );
  }
}

class Replies extends StatefulWidget {
  const Replies({super.key, required this.comment});
  final Comment comment;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  bool _expanded = false;
  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_expanded)
          for (var reply in widget.comment.replies)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
              child: Styled.widget(child: CommentItem(comment: reply)).backgroundColor(ColorPalette.backgroundColor).opacity(0.7).padding(left: kMinPadding),
            ),
        Row(
          children: [
            const SizedBox(width: 8),
            if (widget.comment.votesCount > 0)
              TextButton(
                onPressed: () => {},
                child: Text(
                  '${widget.comment.votesCount} votes',
                  style: TextStyles.defaultStyle.subTitleColor,
                ),
              ),
            if (widget.comment.repliesCount > 0)
              TextButton(
                onPressed: _toggleExpansion,
                child: Text(
                  _expanded ? 'Hide replies' : '${widget.comment.repliesCount} replies',
                  style: TextStyles.defaultStyle.subTitleColor,
                ),
              )
          ],
        ),
      ],
    );
  }
}
