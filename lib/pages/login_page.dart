import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/pages/register_page.dart';
import 'package:wallet_app/services/auth_service.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'otp_verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  
  // Para controlar el tipo de inicio de sesión (email o teléfono)
  bool _isPhoneLogin = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        final authService = Provider.of<AuthService>(context, listen: false);
        
        if (_isPhoneLogin) {
          // Inicio de sesión con número de teléfono
          await authService.signInWithPhoneNumber(
            phoneNumber: _phoneController.text.trim(),
            context: context,
            onCodeSent: (String verificationId) {
              // Navegar a la página de verificación OTP
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerificationPage(
                    phoneNumber: _phoneController.text.trim(),
                    verificationId: verificationId,
                    isRegistration: false,
                  ),
                ),
              );
            },
          );
        } else {
          // Inicio de sesión con email y contraseña
          await authService.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
          // No necesitamos navegar manualmente, el Wrapper se encargará de eso
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Error al iniciar sesión: ${e.toString()}';
        });
      } finally {
        if (mounted && !_isPhoneLogin) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/splash_logo.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 40),
                    
                    // Selector de tipo de inicio de sesión
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isPhoneLogin = false;
                                  _errorMessage = '';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: !_isPhoneLogin
                                    ? MyColorTheme.medievalRed
                                    : Colors.transparent,
                                foregroundColor: !_isPhoneLogin
                                    ? Colors.white
                                    : Colors.white,
                                elevation: !_isPhoneLogin ? 2 : 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                              ),
                              child: const Text('Email'),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isPhoneLogin = true;
                                  _errorMessage = '';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isPhoneLogin
                                    ? MyColorTheme.medievalRed
                                    : Colors.transparent,
                                foregroundColor: _isPhoneLogin
                                    ? Colors.white
                                    : Colors.white,
                                elevation: _isPhoneLogin ? 2 : 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                              child: const Text('Teléfono'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Campos condicionales según el tipo de inicio de sesión
                    if (_isPhoneLogin)
                      // Campo de teléfono
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text(
                            'Número de teléfono (con código de país)',
                            style: MyTextTheme.small,
                          ),
                          hintText: '+57 1234567890',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        style: MyTextTheme.regular,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu número de teléfono';
                          }
                          if (!value.startsWith('+')) {
                            return 'Incluye el código de país (ej: +52)';
                          }
                          return null;
                        },
                      )
                    else
                      // Campos de email y contraseña
                      Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                'Correo electrónico',
                                style: MyTextTheme.small,
                              ),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: MyTextTheme.regular,
                            cursorColor: Colors.white,
                            validator: (value) {
                              if (!_isPhoneLogin) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu correo';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Ingresa un correo válido';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                'Contraseña',
                                style: MyTextTheme.small,
                              ),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            style: MyTextTheme.regular,
                            validator: (value) {
                              if (!_isPhoneLogin) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu contraseña';
                                }
                                if (value.length < 6) {
                                  return 'La contraseña debe tener al menos 6 caracteres';
                                }
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: MyColorTheme.medievalRed),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 40),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator(color: Colors.white))
                        : ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColorTheme.medievalRed,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              _isPhoneLogin
                                  ? "Continuar con teléfono"
                                  : "Iniciar sesión con email",
                              style: const TextStyle(fontSize: 16),
                            ),
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
      ),
    );
  }
}
