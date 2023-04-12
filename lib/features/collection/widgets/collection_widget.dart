import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/core/extensions/extensions.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/features/collection/collection.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class CollectionWidget extends StatefulWidget {
  const CollectionWidget({
    super.key,
  });

  @override
  State<CollectionWidget> createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                const Header(title: 'Collections'),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return CollectionListItem(
                    item: state.items[index],
                    following: state.followings[state.items[index].id] ?? false,
                  );
                },
                childCount: state.items.length,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: state.status == CollectionStatus.initial ? const ListLoadingInitial() : null,
                ),
                Center(
                  child: state.status == CollectionStatus.loading ? const ListLoadingMore() : null,
                ),
                Center(
                  child: state.status == CollectionStatus.failure ? const ListLoadingFail() : null,
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
    if (_isBottom) context.read<CollectionBloc>().add(CollectionFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class CollectionListItem extends StatelessWidget {
  const CollectionListItem({super.key, required this.item, required this.following});

  final Collection item;
  final bool following;

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed('/collection-detail/${item.id}'),
        leading: ImageView(
          url: item.coverImage,
          width: 15.0.w,
          height: 15.0.w,
          fit: BoxFit.cover,
        ),
        title: Text(item.name, style: TextStyles.defaultStyle.fontSubTitle),
        subtitle: Styled.widget(
          child: Text(
            item.followersCountString,
            style: TextStyles.defaultStyle.fontSubTitle.subTitleColor,
            maxLines: 2,
          ),
        ).padding(top: kMinPadding),
        trailing: SlideInRight(
          child: OutlinedButton(
            onPressed: () {
              context.read<CollectionBloc>().add(CollectionFollowUpdated(item));
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
