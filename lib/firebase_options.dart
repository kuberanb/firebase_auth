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
    apiKey: 'AIzaSyBUaVrrkosi9rVlVoyRxfZ4KiZPDYBNP0k',
    appId: '1:932410298500:web:cde63bb28b4b5789ef32d1',
    messagingSenderId: '932410298500',
    projectId: 'emcus-f3c05',
    authDomain: 'emcus-f3c05.firebaseapp.com',
    storageBucket: 'emcus-f3c05.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6C3-1_bTozjEdsoEdOj64_AS5cX_aOrM',
    appId: '1:932410298500:android:dad6541c26b469a0ef32d1',
    messagingSenderId: '932410298500',
    projectId: 'emcus-f3c05',
    storageBucket: 'emcus-f3c05.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS5m8sd2Uh_KKaDTiEI46r_H6wUvNHMy8',
    appId: '1:932410298500:ios:db3e166a26ad2bc1ef32d1',
    messagingSenderId: '932410298500',
    projectId: 'emcus-f3c05',
    storageBucket: 'emcus-f3c05.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBS5m8sd2Uh_KKaDTiEI46r_H6wUvNHMy8',
    appId: '1:932410298500:ios:db3e166a26ad2bc1ef32d1',
    messagingSenderId: '932410298500',
    projectId: 'emcus-f3c05',
    storageBucket: 'emcus-f3c05.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUaVrrkosi9rVlVoyRxfZ4KiZPDYBNP0k',
    appId: '1:932410298500:web:3d23ff31d7fb2044ef32d1',
    messagingSenderId: '932410298500',
    projectId: 'emcus-f3c05',
    authDomain: 'emcus-f3c05.firebaseapp.com',
    storageBucket: 'emcus-f3c05.appspot.com',
  );
}
