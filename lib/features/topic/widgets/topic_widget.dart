import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:styled_widget/styled_widget.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Trending Topics'),
          BlocBuilder<TopicBloc, TopicState>(
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: state.trendingStatus == TopicStatus.initial ? const ListLoadingInitial() : null,
                  ),
                  Center(
                    child: state.trendingStatus == TopicStatus.failure ? const ListLoadingFail() : null,
                  ),
                  Column(
                    children: [
                      for (var topic in state.trendingTopics)
                        TopicListItem(
                          item: topic,
                          following: state.followings[topic.id] ?? false,
                        )
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: kDefaultPadding),
          const Header(title: 'Popular Topics'),
          BlocBuilder<TopicBloc, TopicState>(
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: state.popularStatus == TopicStatus.initial ? const ListLoadingInitial() : null,
                  ),
                  Center(
                    child: state.popularStatus == TopicStatus.failure ? const ListLoadingFail() : null,
                  ),
                  Column(
                    children: [
                      for (var topic in state.popularTopics)
                        TopicListItem(
                          item: topic,
                          following: state.followings[topic.id] ?? false,
                        )
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}

class TopicListItem extends StatelessWidget {
  const TopicListItem({super.key, required this.item, required this.following});

  final Topic item;
  final bool following;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed('/topic-detail/${item.slug}'),
        title: SlideInLeft(child: Text(item.name, style: TextStyles.defaultStyle.fontTitle)),
        subtitle: SlideInLeft(
          child: Styled.widget(
            child: Text(
              item.followersCountString,
              style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
              maxLines: 2,
            ),
          ).padding(top: kMinPadding),
        ),
        trailing: SlideInRight(
          child: OutlinedButton(
            onPressed: () {
              context.read<TopicBloc>().add(TopicFollowUpdated(item));
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: following == true ? ColorPalette.primaryColor : Colors.white30),
            ),
            child: Text(
              following == true ? 'Following' : 'Follow',
              style: TextStyles.defaultStyle.copyWith(color: following == true ? ColorPalette.primaryColor : Colors.white54),
            ),
          ),
        ),
      ),
    ).padding(vertical: 5).backgroundColor(ColorPalette.backgroundColor);
  }
}
