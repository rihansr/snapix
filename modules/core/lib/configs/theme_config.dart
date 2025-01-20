import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colour.dart';

ThemeData theming(ThemeMode mode) {
  ColorPalette colorPalette;
  switch (mode) {
    case ThemeMode.light:
      colorPalette = ColorPalette.light();
      break;
    case ThemeMode.dark:
    default:
      colorPalette = ColorPalette.dark();
  }

  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    colorScheme: ColorScheme(
      brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
      primary: colorPalette.primary,
      onPrimary: colorPalette.onPrimary,
      secondary: colorPalette.secondary,
      onSecondary: colorPalette.onSecondary,
      tertiary: colorPalette.tertiary,
      onTertiary: colorPalette.onTertiary,
      surface: colorPalette.surface,
      onSurface: colorPalette.onSurface,
      error: colorPalette.error,
      onError: colorPalette.onError,
      shadow: colorPalette.shadow,
      outline: colorPalette.outline,
      surfaceTint: Colors.transparent,
    ),
    dialogBackgroundColor: colorPalette.scaffold,
    canvasColor: colorPalette.surface,
    primaryColor: colorPalette.primary,
    dividerColor: colorPalette.divider,
    shadowColor: colorPalette.shadow,
    scaffoldBackgroundColor: colorPalette.scaffold,
    cardColor: colorPalette.card,
    hintColor: colorPalette.hint,
    disabledColor: colorPalette.disable,
    iconTheme: IconThemeData(
      color: colorPalette.icon,
      size: 24,
    ),
    appBarTheme: const AppBarTheme().copyWith(
      color: colorPalette.surface,
      foregroundColor: colorPalette.icon,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: colorPalette.icon, size: 24),
      actionsIconTheme: IconThemeData(color: colorPalette.icon, size: 24),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: colorPalette.paragraph,
      ),
    ),
    textTheme: const TextTheme().copyWith(
      headlineLarge: TextStyle(
        fontSize: 26,
        color: colorPalette.headline,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: colorPalette.headline,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        color: colorPalette.headline,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: colorPalette.paragraph,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: colorPalette.subtitle,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

set systemUIOverlayStyle(ThemeMode mode) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          mode == ThemeMode.light ? Brightness.dark : Brightness.light,
    ),
  );
}
