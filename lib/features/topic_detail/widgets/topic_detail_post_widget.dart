import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/features/topic_detail/topic_detail.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class TopicDetailPostWidget extends StatelessWidget {
  const TopicDetailPostWidget({super.key, required this.topicSlug, required this.header});
  final String topicSlug;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicDetailPostBloc(repository: context.read<Repository>())..add(TopicDetailPostFetched(topicSlug: topicSlug)),
      child: TopidDetailPost(topicSlug: topicSlug, header: header),
    );
  }
}

class TopidDetailPost extends StatefulWidget {
  const TopidDetailPost({super.key, required this.topicSlug, required this.header});
  final String topicSlug;
  final Widget header;

  @override
  State<TopidDetailPost> createState() => _TopidDetailPostState();
}

class _TopidDetailPostState extends State<TopidDetailPost> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicDetailPostBloc, TopicDetailPostState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([widget.header]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return PostListItem(item: state.items[index]);
                },
                childCount: state.items.length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: state.status == TopicDetailPostStatus.initial ? const ListLoadingInitial() : null,
                ),
                Center(
                  child: state.status == TopicDetailPostStatus.loading ? const ListLoadingMore() : null,
                ),
                Center(
                  child: state.status == TopicDetailPostStatus.failure ? const ListLoadingFail() : null,
                ),
                const SizedBox(
                  height: 100,
                )
              ]),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<TopicDetailPostBloc>().add(TopicDetailPostFetched(topicSlug: widget.topicSlug));
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
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
        leading: ImageView(url: item.thumbnail.url, width: 15.0.w, height: 15.0.w),
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
                  size: 25.sp,
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
