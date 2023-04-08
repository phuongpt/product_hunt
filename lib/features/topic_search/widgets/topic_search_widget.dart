import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';
import 'package:styled_widget/styled_widget.dart';

class TopicSearchWidget extends StatefulWidget {
  const TopicSearchWidget({
    super.key,
  });

  @override
  State<TopicSearchWidget> createState() => _TopicSearchWidgetState();
}

class _TopicSearchWidgetState extends State<TopicSearchWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicSearchBloc, TopicSearchState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return TopicListItem(item: state.items[index]);
                },
                childCount: state.items.length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: state.status == TopicSearchStatus.empty ? const Center() : null,
                ),
                Center(
                  child: state.status == TopicSearchStatus.loading ? const ListLoadingMore() : null,
                ),
                Center(
                  child: state.status == TopicSearchStatus.failure ? const ListLoadingFail() : null,
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
    if (_isBottom) context.read<TopicSearchBloc>().add(TopicSearchFetchedMore());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class TopicListItem extends StatelessWidget {
  const TopicListItem({super.key, required this.item});

  final Topic item;

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      child: Styled.widget(
        child: ListTile(
          onTap: () => Navigator.of(context).pushNamed('/topic-detail/${item.slug}'),
          title: Text(item.name, style: TextStyles.defaultStyle.fontTitle),
          subtitle: Styled.widget(
            child: Text(
              item.followersCountString,
              style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
              maxLines: 2,
            ),
          ).padding(top: kMinPadding),
        ),
      ).padding(vertical: 5).backgroundColor(ColorPalette.backgroundColor),
    );
  }
}
