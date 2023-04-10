import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/post_detail/post_detail.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/l10n/l10n.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, this.slug = ''});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostDetailCubit(repository: context.read<Repository>())..fetchData(slug),
      child: const PostDetailView(),
    );
  }
}

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.adaptive.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: ColorPalette.backgroundScaffoldColor,
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.failure:
              return const ListLoadingFail();
            case Status.success:
              return PostDetailWidget(item: state.item!);
            case Status.update:
              return PostDetailWidget(item: state.item!);
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
