import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/models.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/post/bloc/post_bloc.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/l10n/l10n.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(repository: context.read<Repository>())..add(PostFetched()),
      child: const PostView(),
    );
  }
}

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: ColorPalette.backgroundScaffoldColor,
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  const Header(),
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
                  )
                ]),
              ),
            ],
          );
        },
      ),
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

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Styled.text(
      'Product List',
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: TextStyles.defaultStyle.fontHeader,
    ).padding(bottom: 20, horizontal: 15, top: 10);
  }
}

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.item});

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
            maxLines: 2,
          ),
        ).padding(top: 5),
        trailing: InkWell(
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
                style: TextStyles.defaultStyle.bold.whiteTextColor,
              ),
            ],
          ),
        ),
      ),
    ).padding(vertical: 5).backgroundColor(ColorPalette.backgroundColor);
  }
}
