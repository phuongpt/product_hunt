import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/models/entities/entities.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/collection_detail/collection_detail.dart';
import 'package:product_hunt/features/shared/shared.dart';
import 'package:product_hunt/l10n/l10n.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key, this.id = ''});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionDetailCubit(repository: context.read<Repository>())..fetchData(id),
      child: const CollectionDetailView(),
    );
  }
}

class CollectionDetailView extends StatelessWidget {
  const CollectionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
        title: BlocSelector<CollectionDetailCubit, CollectionDetailState, Collection?>(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.adaptive.share_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: ColorPalette.backgroundScaffoldColor,
      body: BlocBuilder<CollectionDetailCubit, CollectionDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.failure:
              return const ListLoadingFail();
            case Status.success:
              return CollectionDetailWidget(item: state.item!);
            case Status.update:
              return CollectionDetailWidget(item: state.item!);
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
