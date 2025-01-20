import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/presentation/views/photo_preview_view.dart';
import 'package:snapix/main.dart' as app;
import 'package:gallery/presentation/screens/permission_access_screen.dart';
import 'package:gallery/presentation/screens/gallery_screen.dart';
import 'package:gallery/presentation/screens/album_screen.dart';

void main() {
  group('App Integration Test', () {
    testWidgets(
        'Navigate Permission Access page -> Show Albums -> Album Page -> Image Preview',
        (WidgetTester tester) async {
      await _initialize(tester);

      await _grantPermission(tester);

      await _checkGalleryFuntionalities(tester);

      await _checkAlbumFuntionalities(tester);

      await _ensurePhotoPreview(tester);
    });
  });
}

Future<void> _initialize(WidgetTester tester) async {
  await app.main();
  await tester.pumpAndSettle();
}

Future<void> _grantPermission(WidgetTester tester) async {
  // Ensure  Permission access page is displayed
  expect(find.byType(PermissionAccessScreen), findsOneWidget);

  // Request permission by tapping the button
  final permissionButton = find.byKey(const Key('grant_access_button'));
  expect(permissionButton, findsOneWidget);

  await tester.tap(permissionButton);
  await tester.pumpAndSettle(const Duration(seconds: 5));
}

Future<void> _checkGalleryFuntionalities(WidgetTester tester) async {
  // Ensure the Gallery Page is displayed
  expect(find.byType(GalleryScreen), findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 3));

  // Tap on an album to navigate to the Album Page
  final albumTile = find.byKey(const Key('album_0'));
  expect(albumTile, findsOneWidget);

  await tester.tap(albumTile);
  await tester.pumpAndSettle();
}

Future<void> _checkAlbumFuntionalities(WidgetTester tester) async {
  // Ensure the Album Page is displayed
  expect(find.byType(AlbumScreen), findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  // Tap on an image to navigate to the Image Preview Page
  final imageTile = find.byKey(const Key('photo_0'));
  expect(imageTile, findsOneWidget);

  await tester.tap(imageTile);
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> _ensurePhotoPreview(WidgetTester tester) async{
  // Ensure the Image Preview Page is displayed
  expect(find.byType(PhotoPreview), findsOneWidget);
  await tester.pumpAndSettle();
}
