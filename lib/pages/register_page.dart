import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/services/auth_service.dart';
import 'package:wallet_app/themes/color_theme.dart';
import 'package:wallet_app/themes/text_theme.dart';
import 'otp_verification_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  
  // Para controlar el tipo de registro (email o teléfono)
  bool _isPhoneRegistration = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      // Validación específica para registro con email
      if (!_isPhoneRegistration && _passwordController.text != _confirmPasswordController.text) {
        setState(() {
          _errorMessage = 'Las contraseñas no coinciden';
        });
        return;
      }

      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        final authService = Provider.of<AuthService>(context, listen: false);
        
        if (_isPhoneRegistration) {
          // Registro con número de teléfono
          await authService.registerWithPhoneNumber(
            phoneNumber: _phoneController.text.trim(),
            fullName: _fullNameController.text.trim(),
            context: context,
            onCodeSent: (String verificationId) {
              // Navegar a la página de verificación OTP
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerificationPage(
                    phoneNumber: _phoneController.text.trim(),
                    verificationId: verificationId,
                    isRegistration: true,
                    fullName: _fullNameController.text.trim(),
                  ),
                ),
              );
            },
          );
        } else {
          // Registro con email y contraseña
          await authService.registerWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            fullName: _fullNameController.text.trim(),
          );
          // No necesitamos navegar manualmente, el Wrapper se encargará de eso
          if (mounted) {
            Navigator.of(context).pop(); // Volver a la pantalla de login
          }
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Error al registrar: ${e.toString()}';
        });
      } finally {
        if (mounted && !_isPhoneRegistration) {
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
      appBar: AppBar(
        title: const Text(
          "Registro",
          style: TextStyle(color: MyColorTheme.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.keyboard_backspace_rounded,
            color: MyColorTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Selector de tipo de registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isPhoneRegistration = false;
                            _errorMessage = '';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !_isPhoneRegistration
                              ? MyColorTheme.medievalRed
                              : Colors.grey.shade300,
                          foregroundColor: !_isPhoneRegistration
                              ? Colors.white
                              : Colors.black,
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
                            _isPhoneRegistration = true;
                            _errorMessage = '';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isPhoneRegistration
                              ? MyColorTheme.medievalRed
                              : Colors.grey.shade300,
                          foregroundColor: _isPhoneRegistration
                              ? Colors.white
                              : Colors.black,
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
                const SizedBox(height: 24),
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    label: Text(
                      'Ingresa tu nombre completo',
                      style: MyTextTheme.small,
                    ),
                  ),
                  style: MyTextTheme.regular,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Campos condicionales según el tipo de registro
                if (_isPhoneRegistration)
                  // Campo de teléfono
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Número de teléfono (con código de país)',
                        style: MyTextTheme.small,
                      ),
                      hintText: '+52 1234567890',
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
                          label: Text(
                            'Correo electrónico',
                            style: MyTextTheme.small,
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: MyTextTheme.regular,
                        validator: (value) {
                          if (!_isPhoneRegistration) {
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
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Contraseña',
                            style: MyTextTheme.small,
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        style: MyTextTheme.regular,
                        validator: (value) {
                          if (!_isPhoneRegistration) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa una contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Confirmar contraseña',
                            style: MyTextTheme.small,
                          ),
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        obscureText: true,
                        style: MyTextTheme.regular,
                        validator: (value) {
                          if (!_isPhoneRegistration) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor confirma tu contraseña';
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
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 40),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColorTheme.medievalRed,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _isPhoneRegistration
                              ? "Continuar con teléfono"
                              : "Registrarse con email",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
