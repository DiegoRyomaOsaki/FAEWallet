import 'package:flutter/material.dart';

import 'color_theme.dart';

class MyInputDecoration {
  static InputDecorationTheme inputDecoration = InputDecorationTheme(
    focusColor: MyColorTheme.medievalRed,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: MyColorTheme.gray,
        width: 1,
      ),
    ),
  );
}
