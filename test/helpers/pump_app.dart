import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/l10n/l10n.dart';

class MockRepository extends Mock implements Repository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    Repository? repository,
  }) {
    return pumpWidget(
      RepositoryProvider.value(
        value: repository ?? MockRepository(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: widget),
        ),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    Repository? repository,
  }) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
      repository: repository,
    );
  }
}
