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
    apiKey: 'AIzaSyCXhMDF8Dtv6PjtWvAwNM1jU-sepTgdBxI',
    appId: '1:480479797436:web:891740326e62f593a6b0b9',
    messagingSenderId: '480479797436',
    projectId: 'premerio',
    authDomain: 'premerio.firebaseapp.com',
    databaseURL: 'https://premerio.firebaseio.com',
    storageBucket: 'premerio.appspot.com',
    measurementId: 'G-B1WYBKS9WN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCE8JYsxnX113XH9AeQFljgAef6aBSYcEo',
    appId: '1:480479797436:android:5a8d45809b958672a6b0b9',
    messagingSenderId: '480479797436',
    projectId: 'premerio',
    databaseURL: 'https://premerio.firebaseio.com',
    storageBucket: 'premerio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCn2DmgoiAmRMpTLUSfKqe7nmgLc8PALMY',
    appId: '1:480479797436:ios:8d34c6cc70eeace6a6b0b9',
    messagingSenderId: '480479797436',
    projectId: 'premerio',
    databaseURL: 'https://premerio.firebaseio.com',
    storageBucket: 'premerio.appspot.com',
    androidClientId: '480479797436-99drvbq1e65rhri8emtq8l759sh62hkh.apps.googleusercontent.com',
    iosClientId: '480479797436-0d6kc6g74vlhtsi5vvshpt3b9bg1jq8s.apps.googleusercontent.com',
    iosBundleId: 'com.example.dattaDevsthanPimpalgaon',
  );
}