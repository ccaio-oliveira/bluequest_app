import 'package:bluequest/design_system/tokens/bq_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bluequest/design_system/tokens/bq_colors.dart';

abstract final class BQTheme {
  static const systemOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData dark() {
    final base = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: BQColors.bg0,
      colorScheme: const ColorScheme.dark(
        primary: BQColors.blue,
        onPrimary: BQColors.onBlue,
        secondary: BQColors.amber,
        onSecondary: BQColors.onAmber,
        error: BQColors.red,
        onError: BQColors.text1,
        surface: BQColors.bg1,
        onSurface: BQColors.text1,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    );

    return base.copyWith(
      textTheme: base.textTheme
          .apply(bodyColor: BQColors.text1, displayColor: BQColors.text1)
          .copyWith(bodyMedium: BQText.body(BQTypeScale.body)),
    );
  }
}
