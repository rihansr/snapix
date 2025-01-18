import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ColorPalette {
  Color primary;
  Color onPrimary;
  Color secondary;
  Color onSecondary;
  Color surface;
  Color onSurface;
  Color scaffold;
  Color card;
  Color shadow;
  Color icon;
  Color headline;
  Color paragraph;
  Color subtitle;
  Color hint;
  Color outline;
  Color divider;
  Color disable;
  Color error;
  Color onError;

  ColorPalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.scaffold,
    required this.card,
    required this.shadow,
    required this.icon,
    required this.headline,
    required this.paragraph,
    required this.subtitle,
    required this.hint,
    required this.outline,
    required this.divider,
    required this.disable,
    required this.error,
    required this.onError,
  });

  factory ColorPalette.light() => ColorPalette(
        primary: const Color(0xFF66FFB6),
        onPrimary: const Color(0xFF000000),
        secondary: const Color(0xFF232222),
        onSecondary: const Color(0xFFFFFFFF),
        surface: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF000000),
        scaffold: const Color(0xFFFAFAFB),
        card: const Color(0xFFFFFFFF),
        shadow: const Color(0x1A101828),
        icon: const Color(0xFF342E5E),
        headline: const Color(0xFF363636),
        paragraph: const Color(0xFF212020),
        subtitle: const Color(0xFF676767),
        hint: const Color(0xFF797595),
        outline: const Color(0xFFC1BFCE),
        divider: const Color(0xFFEBEBEF),
        disable: const Color(0xFFC1BFCE),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );

  factory ColorPalette.dark() => ColorPalette(
        primary: const Color(0xFF66FFB6),
        onPrimary: const Color(0xFF000000),
        secondary: const Color(0xFF232222),
        onSecondary: const Color(0xFFFFFFFF),
        surface: const Color(0xFF1C1C1E),
        onSurface: const Color(0xFFFFFFFF),
        scaffold: const Color(0xFF000000),
        card: const Color(0xFF1C1C1E),
        shadow: const Color(0x1AFFFFFF),
        icon: const Color(0xFFFFFFFF),
        headline: const Color(0xFFFFFFFF),
        paragraph: const Color(0xFFC1BFCE),
        subtitle: const Color(0xFFB2B0C2),
        hint: const Color(0xFF797595),
        outline: const Color(0xFF797595),
        divider: const Color(0xFFFFFFFF),
        disable: const Color(0xFF535353),
        error: const Color(0xFFDC3545),
        onError: const Color(0xFFFFFFFF),
      );
}