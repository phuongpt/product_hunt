import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/features/topic_detail/topic_detail.dart';
import 'package:product_hunt/l10n/l10n.dart';

class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({super.key, this.slug = ''});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicDetailCubit(repository: context.read<Repository>())..fetchData(slug),
      child: const TopicDetailView(),
    );
  }
}

class TopicDetailView extends StatelessWidget {
  const TopicDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
        title: BlocSelector<TopicDetailCubit, TopicDetailState, Topic?>(
          selector: (state) => state.item,
          builder: (context, state) => Text(state?.name ?? ''),
        ),
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
      body: BlocBuilder<TopicDetailCubit, TopicDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.failure:
              return const ListLoadingFail();
            case Status.success:
              return TopicDetailWidget(item: state.item!);
            case Status.update:
              return TopicDetailWidget(item: state.item!);
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
