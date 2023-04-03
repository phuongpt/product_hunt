import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/app/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:product_hunt/app/nav_bar/widgets/bottom_nav_bar.dart';
import 'package:product_hunt/features/counter/view/counter_page.dart';

class BottomNav extends StatefulWidget {
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
            bottomNavigationBar: BottomNavBar(
              onChange: (index) {
                NavBarCubit.get(context).changeBottomNavBar(index);
              },
              defaultSelectedIndex: 0,
              backgroundColor: Colors.grey.shade100,
              radius: 25,
              showLabel: false,
              textList: const [
                'Home',
                'Camera',
                'Messenger',
                'User',
              ],
              iconList: const [
                Icons.home_outlined,
                Icons.camera,
                Icons.mail_outline,
                Icons.person_outline,
              ],
            ),
            appBar: AppBar(
              title: const Text('Custom Nav bar'),
            ),
            extendBody: true,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: BlocBuilder<NavBarCubit, NavBarState>(
                builder: (context, state) {
                  switch (state.currentIndex) {
                    case 0:
                      return CounterPage();
                    default:
                      return Container(
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Text('Hello from Item ${state.currentIndex}'),
                        ),
                      );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
