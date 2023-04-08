import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/color_palatte.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:product_hunt/features/topic/widgets/widgets.dart';
import 'package:product_hunt/l10n/l10n.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicBloc(repository: context.read<Repository>())..add(TopicFetched()),
      child: const TopicView(),
    );
  }
}

class TopicView extends StatelessWidget {
  const TopicView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.of(context).pushNamed('/search');
          },
          child: const TextField(
            enabled: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(kMinPadding),
              prefixIcon: Icon(
                Icons.search,
                color: ColorPalette.backgroundColorReverse,
              ),
              hintText: 'Search Product',
              hintStyle: TextStyles.defaultStyle,
              filled: false,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.backgroundColorReverse,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: ColorPalette.backgroundScaffoldColor,
        elevation: 0,
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
      body: const TopicWidget(),
    );
  }
}
