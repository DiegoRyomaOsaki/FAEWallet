import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/config/timeago_config.dart';
import 'package:wallet_app/pages/login_page.dart';
import 'package:wallet_app/themes/app_bar_theme.dart';
import 'package:wallet_app/themes/button_theme.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/input_decoration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallet_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/auth_service.dart';
import 'package:wallet_app/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyColorTheme.medievalRed, // Status bar
  ));

  // Inicializar configuración de timeago
  TimeagoConfig.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Wallet App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: MyColorTheme.black,
            displayColor: MyColorTheme.black,
          ),
          primarySwatch: MyColorTheme.primarySwatch,
          brightness: Brightness.light,
          primaryColor: MyColorTheme.medievalRed,
          scaffoldBackgroundColor: MyColorTheme.white,
          elevatedButtonTheme: MyButtonTheme.elevatedButtonThemeData,
          inputDecorationTheme: MyInputDecoration.inputDecoration,
          appBarTheme: MyAppBarTheme.appBarTheme,
          useMaterial3: false,
        ),
        home: const Wrapper(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: MyColorTheme.black,
          displayColor: MyColorTheme.black,
        ),
        primarySwatch: MyColorTheme.primarySwatch,
        brightness: Brightness.light,
        primaryColor: MyColorTheme.medievalRed,
        scaffoldBackgroundColor: MyColorTheme.white,
        elevatedButtonTheme: MyButtonTheme.elevatedButtonThemeData,
        inputDecorationTheme: MyInputDecoration.inputDecoration,
        appBarTheme: MyAppBarTheme.appBarTheme,
        useMaterial3: false,
      ),
      home: const LoginPage(),
    );
  }
}
