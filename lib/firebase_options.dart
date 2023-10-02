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
    apiKey: 'AIzaSyDUIqSBw80CIzsjUA8X5Zt0oZH2kGca5h4',
    appId: '1:315739359808:web:3c61614e0ecf0140f2eda5',
    messagingSenderId: '315739359808',
    projectId: 'myproject-8a448',
    authDomain: 'myproject-8a448.firebaseapp.com',
    storageBucket: 'myproject-8a448.appspot.com',
    measurementId: 'G-SC7K65L3KT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTAHow4gkDfQ_aSVV3ygVQXVdgOkkeW74',
    appId: '1:315739359808:android:daa053bca7ee442ef2eda5',
    messagingSenderId: '315739359808',
    projectId: 'myproject-8a448',
    storageBucket: 'myproject-8a448.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuxYAGqUzmHaiC-M01qzpx32zM3OsjC4o',
    appId: '1:315739359808:ios:f1dd841c708f903ff2eda5',
    messagingSenderId: '315739359808',
    projectId: 'myproject-8a448',
    storageBucket: 'myproject-8a448.appspot.com',
    iosBundleId: 'com.example.exam2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuxYAGqUzmHaiC-M01qzpx32zM3OsjC4o',
    appId: '1:315739359808:ios:c60c236be7e4d569f2eda5',
    messagingSenderId: '315739359808',
    projectId: 'myproject-8a448',
    storageBucket: 'myproject-8a448.appspot.com',
    iosBundleId: 'com.example.exam2.RunnerTests',
  );
}