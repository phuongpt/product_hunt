import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/features/post_detail/cubit/post_detail_cubit.dart';
import 'package:product_hunt/features/post_detail/widgets/widgets.dart';
import 'package:product_hunt/features/shared/image/image.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailWidget extends StatelessWidget {
  const PostDetailWidget({super.key, required this.item});
  final Post item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostDetailHeader(item: item),
          SliderImages(items: item.media),
          Buttons(post: item),
          DescriptionLine(text: item.description, date: item.featuredAt),
          TopicsLine(topics: item.topics),
          PostDetailCommentsWidget(items: item.comments)
        ],
      ),
    );
  }
}

class TopicsLine extends StatelessWidget {
  const TopicsLine({super.key, required this.topics});
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
              onPressed: () {
                Navigator.of(context).pushNamed('/topic-detail/${topics[index].slug}');
              },
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
  const DescriptionLine({super.key, required this.text, required this.date});
  final String text;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMaxPadding, horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (date != null)
            Text(
              'FEATURED AT ${DateFormat('MM-dd-yyyy').format(date!)}',
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

class Buttons extends StatefulWidget {
  const Buttons({super.key, required this.post});
  final Post post;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> with SingleTickerProviderStateMixin {
  late AnimationController animateController;

  @override
  void initState() {
    super.initState();
    animateController = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    if (animateController.isAnimating) {
      animateController.stop();
    }
    super.dispose();
  }

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
              onPressed: () async {
                try {
                  final uri = Uri.parse(widget.post.website ?? '');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                } catch (_) {}
              },
              child: Text('GET IT', style: TextStyles.defaultStyle.darkTextColor.bold.fontButton),
            ),
          ).width(42.0.w).height(40.0.sp),
          BlocConsumer<PostDetailCubit, PostDetailState>(
            buildWhen: (previous, current) => previous.upVoted != current.upVoted,
            listener: (context, state) => animateController.forward(from: 0),
            builder: (context, state) {
              return FlipInX(
                controller: (controller) => animateController = controller,
                manualTrigger: true,
                child: Styled.widget(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: state.upVoted ? ColorPalette.primaryColor : ColorPalette.backgroundColorReverse),
                    onPressed: () => {context.read<PostDetailCubit>().upVote()},
                    icon: Icon(
                      Icons.arrow_drop_up_outlined,
                      size: 40,
                      color: state.upVoted ? Colors.white : Colors.black,
                    ),
                    label:
                        Text('UPVOTE', style: state.upVoted ? TextStyles.defaultStyle.bold.fontButton : TextStyles.defaultStyle.darkTextColor.bold.fontButton),
                  ),
                ).width(42.0.w).height(40.0.sp),
              );
            },
          )
        ],
      ),
    );
  }
}

class SliderImages extends StatelessWidget {
  const SliderImages({super.key, required this.items});
  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30.0.h,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: CarouselSlider(
        options: CarouselOptions(),
        items: items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
                child: ImageView(
                  url: item.url,
                  width: 90.0.w,
                  fit: BoxFit.contain,
                ),
              );
            },
          );
        }).toList(),
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
        leading: ImageView(
          url: item.thumbnail.url,
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
