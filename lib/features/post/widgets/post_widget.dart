import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/post/post.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                const Header(title: 'Next Things'),
              ]),
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
                  child: state.status == PostStatus.initial ? const ListLoadingInitial() : null,
                ),
                Center(
                  child: state.status == PostStatus.loading ? const ListLoadingMore() : null,
                ),
                Center(
                  child: state.status == PostStatus.failure ? const ListLoadingFail() : null,
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
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
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
