import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:product_hunt/app/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:product_hunt/core/constants/color_palatte.dart';
import 'package:product_hunt/features/post/post.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
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
                  icon: const Icon(Icons.tips_and_updates_sharp),
                  title: const Text('News'),
                ),
              ],
            ),
            extendBody: true,
            body: BlocBuilder<NavBarCubit, NavBarState>(
              builder: (context, state) {
                return LazyIndexedStack(
                  index: state.currentIndex,
                  children: [
                    const PostPage(),
                    const TopicPage(),
                    Container(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
