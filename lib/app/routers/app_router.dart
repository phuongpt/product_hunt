import 'package:flutter/material.dart';
import 'package:product_hunt/core/exceptions/route_exception.dart';
import 'package:product_hunt/features/post_detail/post_detail.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name!);
    final routeName = uri.pathSegments.first;

    switch (routeName) {
      case 'post-detail':
        final id = uri.pathSegments[1];
        return MaterialPageRoute(
          builder: (_) => PostDetailPage(id: id),
          settings: settings,
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
