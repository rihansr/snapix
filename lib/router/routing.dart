import 'package:core/router/routes.dart';
import 'package:core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:gallery/presentation/screens/permission_access_screen.dart';
import 'package:gallery/presentation/screens/gallery_screen.dart';
import 'package:gallery/presentation/screens/album_screen.dart';
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
        return const GalleryScreen();
      },
    ),
    GoRoute(
      name: Routes.permission,
      path: Routes.permission,
      builder: (BuildContext context, GoRouterState state) {
        return const PermissionAccessScreen();
      },
    ),
    GoRoute(
      name: Routes.album,
      path: '${Routes.album}/:id',
      builder: (BuildContext context, GoRouterState state) {
        String param = state.pathParameters['id'] ?? '';
        return param.isEmpty ? const SizedBox.shrink() : AlbumScreen(id: param);
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
