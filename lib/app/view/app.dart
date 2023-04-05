import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/app/nav_bar/nav_bar.dart';
import 'package:product_hunt/app/routers/app_router.dart';
import 'package:product_hunt/data/repositories/repository.dart';
import 'package:product_hunt/l10n/l10n.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key, required Repository repository}) : _repository = repository;

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: Sizer(builder: (context, orientation, deviceType) {
        return const AppView();
      }),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const BottomNav(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
