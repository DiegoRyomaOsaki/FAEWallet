import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Almacena el ID de verificación para la autenticación con teléfono
  String? _verificationId;
  int? _resendToken;

  // Getter para el ID de verificación
  String? get verificationId => _verificationId;

  // Stream para verificar cambios en el estado de autenticación
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // Método para registrar un nuevo usuario con email y contraseña
  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      // Crear usuario en Firebase Auth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Guardar información adicional en Firestore
      await _firestore.collection('users').doc(result.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'authMethod': 'email',
      });
      
      return result;
    } catch (e) {
      print('Error al registrar usuario: $e');
      rethrow;
    }
  }

  // Método para iniciar sesión con email y contraseña
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error al iniciar sesión: $e');
      rethrow;
    }
  }

  // Método para enviar código de verificación al teléfono
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _resendToken = resendToken;
          codeSent(verificationId, resendToken);
        },
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
        forceResendingToken: _resendToken,
      );
    } catch (e) {
      print('Error al verificar número de teléfono: $e');
      rethrow;
    }
  }

  // Método para registrar un usuario con número de teléfono
  Future<UserCredential?> registerWithPhoneNumber({
    required String phoneNumber,
    required String fullName,
    required BuildContext context,
    required Function(String) onCodeSent,
  }) async {
    try {
      await verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verificación completada (Android)
          UserCredential result = await _auth.signInWithCredential(credential);
          
          // Verificar si es un nuevo usuario
          if (result.additionalUserInfo?.isNewUser ?? false) {
            await _firestore.collection('users').doc(result.user!.uid).set({
              'fullName': fullName,
              'phoneNumber': phoneNumber,
              'createdAt': FieldValue.serverTimestamp(),
              'authMethod': 'phone',
            });
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
      return null; // El resultado se manejará después de la verificación del código
    } catch (e) {
      print('Error al registrar con número de teléfono: $e');
      rethrow;
    }
  }

  // Método para iniciar sesión con número de teléfono
  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
    required BuildContext context,
    required Function(String) onCodeSent,
  }) async {
    try {
      await verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verificación completada (Android)
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      print('Error al iniciar sesión con número de teléfono: $e');
      rethrow;
    }
  }

  // Método para verificar el código SMS
  Future<UserCredential?> verifyOTP({
    required String smsCode,
    required String fullName,
    required String phoneNumber,
    bool isRegistration = false,
  }) async {
    try {
      if (_verificationId == null) {
        throw Exception('No hay un ID de verificación válido');
      }
      
      // Crear credencial con el código SMS
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      
      // Iniciar sesión con la credencial
      UserCredential result = await _auth.signInWithCredential(credential);
      
      // Si es un registro nuevo, guardar información adicional
      if (isRegistration && (result.additionalUserInfo?.isNewUser ?? false)) {
        await _firestore.collection('users').doc(result.user!.uid).set({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
          'authMethod': 'phone',
        });
      }
      
      return result;
    } catch (e) {
      print('Error al verificar código OTP: $e');
      rethrow;
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
      rethrow;
    }
  }
}