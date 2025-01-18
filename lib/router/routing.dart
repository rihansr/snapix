import 'package:core/router/routes.dart';
import 'package:core/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routing = GoRouter(
  navigatorKey: navigator.navigatorKey,
  initialLocation: Routes.gallery,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.gallery,
      path: Routes.gallery,
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold();
      },
    ),
    GoRoute(
      name: Routes.album,
      path: Routes.album,
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold();
      },
    ),
    GoRoute(
      name: Routes.preview,
      path: Routes.preview,
      builder: (BuildContext context, GoRouterState state) {
        final path = state.uri.queryParameters['path'];
        return const Scaffold();
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(),
    body: const Center(
      child: Text('Page not found'),
    ),
  ),
);
