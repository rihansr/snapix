import 'package:core/configs/configs.dart';
import 'package:core/services/navigation_service.dart';
import 'package:core/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:settings/settings.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/utils/utils.dart';
import 'package:snapix/router/routing.dart';
import 'di/inject.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    configureDependencies(),
    utils.isPermissionGranted().then((granted) {
      isStoragePermissionGranted = granted;
      FlutterNativeSplash.remove();
    }),
  ]);
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: sl<Settings>().notifier,
        builder: (_, settings, __) {
          systemUIOverlayStyle = settings.themeMode;
          return MaterialApp.router(
            title: 'Snapix',
            scaffoldMessengerKey: navigator.scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            themeMode: settings.themeMode,
            theme: theming(ThemeMode.light),
            darkTheme: theming(ThemeMode.dark),
            locale: settings.language.locale,
            localizationsDelegates: string.delegates,
            supportedLocales: string.supportedLocales,
            routerConfig: routing,
          );
        });
  }
}
