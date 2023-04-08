import 'package:flutter/material.dart';
import 'package:product_hunt/core/exceptions/route_exception.dart';
import 'package:product_hunt/features/post_detail/post_detail.dart';
import 'package:product_hunt/features/topic_detail/topic_detail.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name!);
    final routeName = uri.pathSegments.first;

    switch (routeName) {
      case 'post-detail':
        final slug = uri.pathSegments[1];
        return MaterialPageRoute(
          builder: (_) => PostDetailPage(slug: slug),
          settings: settings,
        );
      case 'topic-detail':
        final slug = uri.pathSegments[1];
        return MaterialPageRoute(
          builder: (_) => TopicDetailPage(slug: slug),
          settings: settings,
        );
      case 'search':
        return MaterialPageRoute(
          builder: (_) => const TopicSearchPage(),
          settings: settings,
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
