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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: "AIzaSyCuK6m59Cw8qshE18uO6sbqc9qkSEHCSYs",
    authDomain: "indel-flutter.firebaseapp.com",
    projectId: "indel-flutter",
    storageBucket: "indel-flutter.appspot.com",
    messagingSenderId: "378862575045",
    appId: "1:378862575045:web:79af730a9bee22f885ffac",
    measurementId: "G-YT1BC8B5YF",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6ZOpsVMlwZGKMAYM2MB3hOhftby1eiQw',
    appId: '1:378862575045:android:c9cc8e71bc3dce8685ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    storageBucket: 'indel-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWVTe81k0TOo3EC34a9lZzZ7ufpuwwFQ0',
    appId: '1:378862575045:ios:cca734270e3e40a785ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    storageBucket: 'indel-flutter.appspot.com',
    androidClientId:
        '378862575045-k1n8p1cicc61sfka2ecbq2a5c9j8b229.apps.googleusercontent.com',
    iosClientId:
        '378862575045-l8brp9c7bb7pvt30qsdlotlg2rico2i0.apps.googleusercontent.com',
    iosBundleId: 'com.example.indelFlutter',
  );
}
