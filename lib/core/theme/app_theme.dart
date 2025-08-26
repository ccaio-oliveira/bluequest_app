import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    // const primary600 = Color(0xFF1E3A8A);
    const primary500 = Color(0xFF2563EB);
    // const primary400 = Color(0xFF60A5FA);
    const accent = Color(0xFF0EA5E9);

    final scheme = ColorScheme.fromSeed(seedColor: primary500).copyWith(
      primary: primary500,
      secondary: accent,
      surface: Colors.white,
      onSurface: const Color(0xFF0B1220),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      visualDensity: VisualDensity.comfortable,
    );
  }
}
