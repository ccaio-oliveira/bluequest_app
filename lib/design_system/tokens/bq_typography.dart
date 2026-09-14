import 'package:flutter/material.dart';
import 'package:bluequest/design_system/tokens/bq_colors.dart';

abstract final class BQFonts {
  static const display = 'SpaceGrotesk';
}

abstract final class BQTypeScale {
  static const double hero = 40;
  static const double title1 = 28;
  static const double title2 = 22;
  static const double headline = 17;
  static const double body = 15;
  static const double caption = 13;
  static const double micro = 11;
}

abstract final class BQLeading {
  static const double tight = 1.15;
  static const double normal = 1.45;
}

abstract final class BQText {
  static TextStyle display(
    double size, {
    FontWeight weight = FontWeight.w700,
    Color color = BQColors.text1,
  }) {
    return TextStyle(
      fontFamily: BQFonts.display,
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle body(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color color = BQColors.text1,
  }) {
    return TextStyle(fontSize: size, fontWeight: weight, color: color);
  }

  static const overline = TextStyle(
    fontSize: BQTypeScale.micro,
    fontWeight: FontWeight.w600,
    letterSpacing: BQTypeScale.micro * 0.08,
    color: BQColors.text3,
  );
}
