// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDujO71-eUjFExMUhg3NoDWGHS0jQB3sqw',
    appId: '1:555532300794:web:cdce531d0e6280fd54b443',
    messagingSenderId: '555532300794',
    projectId: 'fae-wallet',
    authDomain: 'fae-wallet.firebaseapp.com',
    storageBucket: 'fae-wallet.firebasestorage.app',
    measurementId: 'G-FDEWCQSXXP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9osTrv2W8eqzzOnHOqEqc7NmkC6pcs6w',
    appId: '1:555532300794:android:88893a6cbd586e8e54b443',
    messagingSenderId: '555532300794',
    projectId: 'fae-wallet',
    storageBucket: 'fae-wallet.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARDqcIFCraZJohu0N8CCkI-Iz_vQ2Zklo',
    appId: '1:555532300794:ios:57d490ea02095b0754b443',
    messagingSenderId: '555532300794',
    projectId: 'fae-wallet',
    storageBucket: 'fae-wallet.firebasestorage.app',
    iosBundleId: 'com.example.walletApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDujO71-eUjFExMUhg3NoDWGHS0jQB3sqw',
    appId: '1:555532300794:web:c2713af8da1008cc54b443',
    messagingSenderId: '555532300794',
    projectId: 'fae-wallet',
    authDomain: 'fae-wallet.firebaseapp.com',
    storageBucket: 'fae-wallet.firebasestorage.app',
    measurementId: 'G-DXNLPMRR1R',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARDqcIFCraZJohu0N8CCkI-Iz_vQ2Zklo',
    appId: '1:555532300794:ios:8c35f2ef8f02139e54b443',
    messagingSenderId: '555532300794',
    projectId: 'fae-wallet',
    storageBucket: 'fae-wallet.firebasestorage.app',
    iosBundleId: 'com.faewallet.app',
  );

}