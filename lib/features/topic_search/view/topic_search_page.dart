import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';
import 'package:product_hunt/l10n/l10n.dart';

class TopicSearchPage extends StatelessWidget {
  const TopicSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicSearchBloc(repository: context.read<Repository>()),
      child: const TopicSearchView(),
    );
  }
}

class TopicSearchView extends StatelessWidget {
  const TopicSearchView({super.key});

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
        title: const TopicSearchBar(),
      ),
      backgroundColor: ColorPalette.backgroundScaffoldColor,
      body: const TopicSearchWidget(),
    );
  }
}
