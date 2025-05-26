import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/pages/main_page.dart';
import 'package:wallet_app/pages/register_page.dart';
import 'package:wallet_app/themes/text_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Nota: removí el '/' inicial
            fit: BoxFit.cover, // Cambiado de fill a cover para mejor ajuste
            alignment: Alignment.center, // Añadido para centrar la imagen
          ),
        ),
        child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 72),
                  //SvgPicture.asset('assets/banner_logo.svg'),
                  Image.asset(
                    'assets/splash_logo.png',
                    fit: BoxFit.cover,                    // Ajusta este valor según necesites
                  ),
                  const SizedBox(height: 72),
                  TextFormField(                    
                    decoration: const InputDecoration(   
                      filled: true,
                      fillColor: Colors.white,                   
                      label: Text(
                        'Ingresa tu numero de teléfono',
                        style: MyTextTheme.small,
                      ),                      
                    ),
                    style: MyTextTheme.regular,
                    cursorColor: Colors.white,
                    
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text(
                        'Contraseña',
                        style: MyTextTheme.small,
                      ),
                    ),
                    obscureText: true,
                    style: MyTextTheme.regular,
                  ),
                  const SizedBox(height: 56),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    ),
                    child: const Text("Iniciar sesión"),
                  ),
                  const SizedBox(height: 56),
                  const Text(
                    "¿Problemas para iniciar sesión?",
                    style: MyTextTheme.smallWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    ),
                    child: const Text(
                      "Registrarse",
                      style: MyTextTheme.smallWhite,                      
                      textAlign: TextAlign.center,                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}
