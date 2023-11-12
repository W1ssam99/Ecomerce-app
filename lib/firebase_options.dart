// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDKdmmAzM-LRcenZ4mNRmIoK31vND9OBak',
    appId: '1:523049550344:web:ec201356301553720507bd',
    messagingSenderId: '523049550344',
    projectId: 'ststore-5db6e',
    authDomain: 'ststore-5db6e.firebaseapp.com',
    databaseURL: 'https://ststore-5db6e-default-rtdb.firebaseio.com',
    storageBucket: 'ststore-5db6e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMdC_CekN_JGjG_s9-6iyS6Mi91lza54c',
    appId: '1:523049550344:android:5a761a43214d507a0507bd',
    messagingSenderId: '523049550344',
    projectId: 'ststore-5db6e',
    databaseURL: 'https://ststore-5db6e-default-rtdb.firebaseio.com',
    storageBucket: 'ststore-5db6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKFAHdn_pyZzOvAYD7VlnldawXC84egpI',
    appId: '1:523049550344:ios:7eb287fceaee80020507bd',
    messagingSenderId: '523049550344',
    projectId: 'ststore-5db6e',
    databaseURL: 'https://ststore-5db6e-default-rtdb.firebaseio.com',
    storageBucket: 'ststore-5db6e.appspot.com',
    iosBundleId: 'com.example.clothesStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKFAHdn_pyZzOvAYD7VlnldawXC84egpI',
    appId: '1:523049550344:ios:528cbc93ed1c089e0507bd',
    messagingSenderId: '523049550344',
    projectId: 'ststore-5db6e',
    databaseURL: 'https://ststore-5db6e-default-rtdb.firebaseio.com',
    storageBucket: 'ststore-5db6e.appspot.com',
    iosBundleId: 'com.example.clothesStore.RunnerTests',
  );
}