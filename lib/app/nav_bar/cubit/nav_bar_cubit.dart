import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarInitial(0));
  static NavBarCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNavBar(int index) {
    emit(NavBarInitial(index));
  }
}
