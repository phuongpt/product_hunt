import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/features/post_detail/widgets/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class PostDetailWidget extends StatelessWidget {
  const PostDetailWidget({
    super.key,
    required this.item,
  });

  final Post item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostDetailHeader(item: item),
          SliderImages(item: item.screenshots),
          const Buttons(),
          DescriptionLine(text: item.description, date: item.day),
          TopicsLine(topics: item.topics),
          const CommentTree()
        ],
      ),
    );
  }
}

class TopicsLine extends StatelessWidget {
  const TopicsLine({
    super.key,
    required this.topics,
  });

  final List<Topic> topics;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.0.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topics.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white30),
              ),
              child: Text(
                topics[index].name.toUpperCase(),
                style: TextStyles.defaultStyle.copyWith(color: Colors.white54),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionLine extends StatelessWidget {
  const DescriptionLine({
    super.key,
    required this.text,
    required this.date,
  });

  final String text;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMaxPadding, horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FEATURED AT ${DateFormat('MM-dd-yyyy').format(date)}',
            style: TextStyles.defaultStyle.subTitleColor.fontSubTitle,
          ),
          const SizedBox(height: kItemPadding),
          Text(
            text,
            style: TextStyles.defaultStyle,
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Styled.widget(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () => {},
              child: Text('GET IT', style: TextStyles.defaultStyle.darkTextColor.bold.fontButton),
            ),
          ).width(42.0.w).height(40.0.sp),
          Styled.widget(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.primaryColor),
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_drop_up_outlined,
                size: 40,
              ),
              label: Text('UPVOTE', style: TextStyles.defaultStyle.bold.fontButton),
            ),
          ).width(42.0.w).height(40.0.sp),
        ],
      ),
    );
  }
}

class SliderImages extends StatelessWidget {
  const SliderImages({
    super.key,
    required this.item,
  });

  final Screenshots item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30.0.h,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Image.network(
        item.s850px!,
        fit: BoxFit.cover,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Text('Image not available');
        },
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
            ),
          );
        },
      ),
    );
  }
}

class PostDetailHeader extends StatelessWidget {
  const PostDetailHeader({super.key, required this.item});

  final Post item;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
        leading: Image.network(
          item.thumbnail.imageUrl,
          fit: BoxFit.contain,
        ),
        title: Text(item.name, style: TextStyles.defaultStyle.fontTitle),
        subtitle: Styled.widget(
          child: Text(
            item.tagline,
            style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
          ),
        ).padding(top: kMinPadding),
      ),
    ).padding(vertical: kMinPadding).backgroundColor(ColorPalette.backgroundColor);
  }
}
