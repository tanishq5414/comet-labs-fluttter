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
    apiKey: 'AIzaSyACNz9o25HHWY6-R_7rChvl4gvcjeCOoWk',
    appId: '1:249731818010:web:dcaa259c20af0c44fce7a3',
    messagingSenderId: '249731818010',
    projectId: 'znews-4e8bf',
    authDomain: 'znews-4e8bf.firebaseapp.com',
    storageBucket: 'znews-4e8bf.appspot.com',
    measurementId: 'G-6QH6HLE448',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC84zZ1ffsRVB4kWiuSQiMlPA5n-iI4row',
    appId: '1:249731818010:android:3e7c20e664efd767fce7a3',
    messagingSenderId: '249731818010',
    projectId: 'znews-4e8bf',
    storageBucket: 'znews-4e8bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtUCvLylBOQgbiekQLbgDxd40sLLdbQJY',
    appId: '1:249731818010:ios:c59019d39302112bfce7a3',
    messagingSenderId: '249731818010',
    projectId: 'znews-4e8bf',
    storageBucket: 'znews-4e8bf.appspot.com',
    iosClientId: '249731818010-b6lpc7umo7rccfdp19o699q962mqaasa.apps.googleusercontent.com',
    iosBundleId: 'com.example.cometlabs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtUCvLylBOQgbiekQLbgDxd40sLLdbQJY',
    appId: '1:249731818010:ios:e06339a240cb6fc4fce7a3',
    messagingSenderId: '249731818010',
    projectId: 'znews-4e8bf',
    storageBucket: 'znews-4e8bf.appspot.com',
    iosClientId: '249731818010-amq0r7vgari90pcsr4rv6s8c2n0bvh80.apps.googleusercontent.com',
    iosBundleId: 'com.example.cometlabs.RunnerTests',
  );
}
