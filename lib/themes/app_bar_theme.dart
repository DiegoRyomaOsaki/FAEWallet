import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';

class MyAppBarTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    titleTextStyle: MyTextTheme.bold,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: MyColorTheme.medievalRed, // Status bar
    ),
  );
}
