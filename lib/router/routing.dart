import 'package:core/router/routes.dart';
import 'package:core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:shared/utils/utils.dart';

final GoRouter routing = GoRouter(
  navigatorKey: navigator.navigatorKey,
  initialLocation: Routes.gallery,
  routes: <RouteBase>[
    GoRoute(
      name: Routes.gallery,
      path: Routes.gallery,
      redirect: (context, state) {
        return isStoragePermissionGranted ? null : Routes.permission;
      },
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold();
      },
    ),
    GoRoute(
      name: Routes.permission,
      path: Routes.permission,
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
