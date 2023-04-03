import 'package:flutter/material.dart';
import 'package:product_hunt/core/exceptions/route_exception.dart';
import 'package:product_hunt/features/counter/view/counter_page.dart';

class AppRouter {
  const AppRouter._();
  static const String root = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(
          builder: (_) => const CounterPage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
