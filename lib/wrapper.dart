import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/pages/login_page.dart';
import 'package:wallet_app/pages/main_page.dart';
import 'package:wallet_app/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          
          // Si el usuario está autenticado, mostrar MainPage
          // Si no, mostrar LoginPage
          return user != null ? const MainPage() : const LoginPage();
        }
        
        // Mientras se verifica el estado de autenticación, mostrar un indicador de carga
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}