import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/features/collection/collection.dart';
import 'package:product_hunt/features/post/post.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';
import 'package:product_hunt/nav_bar/nav_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: const BottomNavView(),
    );
  }
}

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: state.currentIndex,
              onTap: (index) => setState(
                () => NavBarCubit.get(context).changeBottomNavBar(index),
              ),
              selectedItemColor: ColorPalette.backgroundColorReverse,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              unselectedItemColor: ColorPalette.backgroundColorReverse,
              selectedColorOpacity: 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  title: const Text('Home'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.explore),
                  title: const Text('Topics'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.group_work_sharp),
                  title: const Text('Collections'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search_sharp),
                  title: const Text('Search'),
                ),
              ],
            ),
            extendBody: true,
            body: LazyIndexedStack(
              index: state.currentIndex,
              children: const [
                PostPage(),
                TopicPage(),
                CollectionPage(),
                TopicSearchPage(
                  canBack: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
