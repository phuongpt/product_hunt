import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class CollectionDetailPostsWidget extends StatelessWidget {
  const CollectionDetailPostsWidget({super.key, required this.items});
  final List<Post>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: kMaxPadding),
      child: Column(
        children: [
          if (items != null)
            for (var post in items!) PostListItem(item: post),
        ],
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.item});

  final Post item;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed('/post-detail/${item.slug}'),
        leading: ImageView(url: item.thumbnail.url, width: 15.0.w),
        title: Text(item.name, style: TextStyles.defaultStyle.fontTitle),
        subtitle: Styled.widget(
          child: Text(
            item.tagline,
            style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
            maxLines: 2,
          ),
        ).padding(top: kMinPadding),
        trailing: SlideInUp(
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 30.sp,
                  color: ColorPalette.backgroundColorReverse,
                ),
                Text(
                  item.votesCount.toString(),
                  style: TextStyles.defaultStyle.bold.lightTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ).padding(vertical: 5).backgroundColor(ColorPalette.backgroundColor);
  }
}
