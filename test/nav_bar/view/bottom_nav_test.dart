import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_hunt/features/collection/collection.dart';
import 'package:product_hunt/features/post/post.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';
import 'package:product_hunt/nav_bar/nav_bar.dart';

class MockNavBarCubit extends MockCubit<NavBarState> implements NavBarCubit {}

void main() {
  group('NavBarBottom', () {
    late NavBarCubit navBarCubit;
    setUp(() {
      navBarCubit = MockNavBarCubit();
    });
  });
}
