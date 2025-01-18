import 'package:core/configs/configs.dart';
import 'package:core/services/navigation_service.dart';
import 'package:core/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:snapix/router/routing.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp.router(
      title: 'Snapix',
      scaffoldMessengerKey: navigator.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: theming(ThemeMode.light),
      darkTheme: theming(ThemeMode.dark),
      locale: const Locale('en'),
      localizationsDelegates: string.delegates,
      supportedLocales: string.supportedLocales,
      routerConfig: routing,
    );
  }
}
