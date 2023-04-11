import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/collection/collection.dart';
import 'package:product_hunt/features/post/post.dart';
import 'package:product_hunt/features/topic/topic.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';
import 'package:product_hunt/nav_bar/nav_bar.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/helpers.dart';

class MockNavBarCubit extends MockCubit<NavBarState> implements NavBarCubit {}

void main() {
  late Repository repository;

  group('NavBarBottom', () {
    late NavBarCubit navBarCubit;
    late MockNavigator navigator;

    setUp(() {
      repository = MockRepository();

      navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});

      navBarCubit = MockNavBarCubit();
      when(() => navBarCubit.state).thenReturn(const NavBarInitial(0));
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: Sizer(
          builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
            return BlocProvider.value(
              value: navBarCubit,
              child: const BottomNavView(),
            );
          },
        ),
      );
    }

    testWidgets(
      'renders Posts Tab '
      'when tab index is set to 0',
      (tester) async {
        when(() => navBarCubit.state).thenReturn(const NavBarInitial(0));

        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );

        expect(find.byType(PostPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders Posts Tab '
      'when Posts navigation button is pressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );
        await tester.tap(find.byIcon(Icons.home));
        verify(() => navBarCubit.changeBottomNavBar(0)).called(1);
      },
    );

    testWidgets(
      'renders Topics Tab '
      'when tab index is set to 1',
      (tester) async {
        when(() => navBarCubit.state).thenReturn(const NavBarInitial(1));

        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );

        expect(find.byType(TopicPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders Topics Tab '
      'when Topics navigation button is pressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );
        await tester.tap(find.byIcon(Icons.explore));
        verify(() => navBarCubit.changeBottomNavBar(1)).called(1);
      },
    );

    testWidgets(
      'renders Collections Tab '
      'when tab index is set to 2',
      (tester) async {
        when(() => navBarCubit.state).thenReturn(const NavBarInitial(2));

        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );

        expect(find.byType(CollectionPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders Collections Tab '
      'when Collections navigation button is pressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );
        await tester.tap(find.byIcon(Icons.group_work_sharp));
        verify(() => navBarCubit.changeBottomNavBar(2)).called(1);
      },
    );

    testWidgets(
      'renders Search Tab '
      'when tab index is set to 3',
      (tester) async {
        when(() => navBarCubit.state).thenReturn(const NavBarInitial(3));

        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );

        expect(find.byType(TopicSearchPage), findsOneWidget);
      },
    );

    testWidgets(
      'renders Search Tab '
      'when Search navigation button is pressed',
      (tester) async {
        await tester.pumpApp(
          buildSubject(),
          repository: repository,
        );
        await tester.tap(find.byIcon(Icons.search_sharp));
        verify(() => navBarCubit.changeBottomNavBar(3)).called(1);
      },
    );
  });
}
