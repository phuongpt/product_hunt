import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_hunt/app/app.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/nav_bar/nav_bar.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group('App', () {
    late Repository repository;
    setUp(() {
      repository = MockRepository();
    });
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(App(repository: repository));
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    late Repository repository;

    setUp(() {
      repository = MockRepository();
    });

    testWidgets('renders BottomNav', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: repository,
          child: const AppView(),
        ),
      );
      expect(find.byType(BottomNavPage), findsOneWidget);
    });
  });
}
