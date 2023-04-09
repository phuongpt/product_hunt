import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/collection/collection.dart';
import 'package:product_hunt/l10n/l10n.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionBloc(repository: context.read<Repository>())..add(CollectionFetched()),
      child: const CollectionView(),
    );
  }
}

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
        title: const Text('Collections'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
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
      body: const CollectionWidget(),
    );
  }
}
