import 'package:flutter/material.dart';

import 'text_theme.dart';
import 'color_theme.dart';

class MyButtonTheme {
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        MyColorTheme.medievalRed,
      ),
      shadowColor: WidgetStateProperty.all<Color>(
        MyColorTheme.medievalRed,
      ),
      elevation: WidgetStateProperty.all<double>(
        16.0,
      ),
      overlayColor: WidgetStateProperty.all<Color>(
        MyColorTheme.medievalBrown,
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(24.0),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        MyTextTheme.bold,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        MyColorTheme.white,
      ),
    ),
  );
}
