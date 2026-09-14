import 'package:flutter/widgets.dart';

abstract final class BQColors {
  // Base — dark-first
  static const bg0 = Color(0xFF060C13);
  static const bg1 = Color(0xFF0C141F);
  static const bg2 = Color(0xFF131E2B);
  static const stroke1 = Color(0xFF242F3D);
  static const stroke2 = Color(0xFF364355);

  static const text1 = Color(0xFFF1F4F7);
  static const text2 = Color(0xFF9FA9B4);
  static const text3 = Color(0xFF677380);

  // Marca
  static const blue = Color(0xFF0098FF);
  static const blueBright = Color(0xFF64C1FF);
  static const blueDim = Color(0xFF082F54);
  static const onBlue = Color(0xFF030915);

  // Gamificação
  static const amber = Color(0xFFF0BB3B);
  static const amberDim = Color(0xFF413007);
  static const onAmber = Color(0xFF201300);

  // Estados
  static const green = Color(0xFF4BC680);
  static const greenDim = Color(0xFF09311B);
  static const red = Color(0xFFEC5B57);
  static const redDim = Color(0xFF451816);

  // Acentos de módulo (doses mínimas)
  static const teal = Color(0xFF30C6BF);
  static const tealDim = Color(0xFF033633);
  static const violet = Color(0xFFB28FEF);
  static const violetDim = Color(0xFF332647);

  // Aliases semânticos
  static const stateFuture = text3;
  static const stateAvailable = blueBright;
  static const stateDone = green;
  static const stateExpired = red;
  static const moduleTraining = blueBright;
  static const moduleNutrition = teal;
  static const moduleBody = violet;
}
