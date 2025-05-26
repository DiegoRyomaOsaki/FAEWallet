import 'package:flutter/material.dart';

class MyColorTheme {
  static const Color primary = Color(0xFF0070BA);
  static const Color primaryShade = Color(0xFF005EA6);
  static const Color primaryDark = Color(0xFF1546A0);
  static const MaterialColor primarySwatch = Colors.blue;

  static Color shadow = const Color(0xFF1546A0).withValues(alpha: 0.5);

  static const Color gray = Color(0xFFF5F7FA);

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF243656);

  static const RadialGradient gradient = RadialGradient(
    colors: [
      medievalRed,
      medievalBrown,
    ],
  );

  static const Color blackShade = Color(0xFF929BAB);

  static const Color green = Color(0xFF37D39B);

  static const Color red = Color(0xFFF47090);

  static const Color medievalRed = Color(0xFF7C142C);

  static const Color medievalYellow = Color(0xFFE4934C);

  static const Color medievalGreen = Color(0xFF008000);

  static const Color medievalBrown = Color(0xFF542B29);
}
