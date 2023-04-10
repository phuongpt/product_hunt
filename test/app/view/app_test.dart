import 'package:flutter_test/flutter_test.dart';
import 'package:product_hunt/app/app.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/features/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App(repository: Repository()));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
