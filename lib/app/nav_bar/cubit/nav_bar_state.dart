part of 'nav_bar_cubit.dart';

abstract class NavBarState extends Equatable {
  const NavBarState(this.currentIndex);
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

class NavBarInitial extends NavBarState {
  const NavBarInitial(super.currentIndex);
}
