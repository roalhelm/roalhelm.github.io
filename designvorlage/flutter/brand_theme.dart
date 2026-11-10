// letmetrythis Design-Tokens fuer Flutter-Apps (v1.0).
// Gleiche Werte wie tokens.css. In eine neue App kopieren und in MaterialApp
// `theme: BrandTheme.light()` und `darkTheme: BrandTheme.dark()` setzen.
// Schriften: Inter und JetBrains Mono in pubspec.yaml unter `fonts:` eintragen,
// sonst faellt Flutter auf die Systemschrift (SF Pro) zurueck, das ist ok.

import 'package:flutter/material.dart';

class BrandColors {
  // Grund
  static const navy900 = Color(0xFF0B1120);
  static const navy850 = Color(0xFF101A2C);
  static const navy700 = Color(0xFF1E2D47);
  static const slate50 = Color(0xFFF4F8FB);
  static const slate200 = Color(0xFFD8E3EC);
  static const slate900 = Color(0xFF0F1B2D);
  static const muted = Color(0xFF94A3B8);

  // Primaer fuer Apps (Teal), fuer Tech-Tools alternativ Cyan
  static const teal300 = Color(0xFF5EEAD4);
  static const teal700 = Color(0xFF0F766E);
  static const cyan400 = Color(0xFF22D3EE);
  static const cyan700 = Color(0xFF0E7490);

  // Akzent
  static const amber = Color(0xFFF59E0B);
  static const onAmber = Color(0xFF1A1308);

  static const danger = Color(0xFFB42318);     // Fehler auf hellem Grund
  static const dangerDark = Color(0xFFF87171); // Fehler auf dunklem Grund
  static const success = Color(0xFF15803D);
}

class BrandRadius {
  static const sm = 6.0;
  static const md = 12.0; // Buttons, Inputs
  static const lg = 20.0; // Karten
  static const xl = 24.0;
}

class BrandSpace {
  static const s1 = 4.0, s2 = 8.0, s3 = 12.0, s4 = 16.0;
  static const s5 = 24.0, s6 = 32.0, s7 = 48.0, s8 = 64.0;
}

class BrandTheme {
  static ThemeData light({Color primary = BrandColors.teal700}) => _build(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        background: BrandColors.slate50,
        surface: Colors.white,
        onSurface: BrandColors.slate900,
        line: BrandColors.slate200,
      );

  static ThemeData dark({Color primary = BrandColors.teal300}) => _build(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: const Color(0xFF042F2E),
        background: BrandColors.navy900,
        surface: BrandColors.navy850,
        onSurface: const Color(0xFFE6EDF7),
        line: BrandColors.navy700,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color primary,
    required Color onPrimary,
    required Color background,
    required Color surface,
    required Color onSurface,
    required Color line,
  }) {
    final scheme = ColorScheme.fromSeed(seedColor: primary, brightness: brightness).copyWith(
      primary: primary,
      onPrimary: onPrimary,
      tertiary: BrandColors.amber,
      onTertiary: BrandColors.onAmber,
      surface: surface,
      onSurface: onSurface,
      error: brightness == Brightness.dark ? BrandColors.dangerDark : BrandColors.danger,
      outline: line,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: onSurface, fontSize: 21, fontWeight: FontWeight.w700),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -1.2),
        titleLarge: TextStyle(fontWeight: FontWeight.w700),
        titleMedium: TextStyle(fontWeight: FontWeight.w700),
        labelSmall: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: BrandSpace.s5, vertical: BrandSpace.s4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BrandRadius.md)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BrandRadius.lg),
          side: BorderSide(color: line),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BrandRadius.md),
          borderSide: BorderSide(color: line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BrandRadius.md),
          borderSide: BorderSide(color: line),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: BrandColors.amber,
        foregroundColor: BrandColors.onAmber,
      ),
    );
  }
}
