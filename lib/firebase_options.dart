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
    apiKey: 'AIzaSyAJKja3ATIr3mRFz3gx1uXdJ_x6lmF4V-c',
    appId: '1:876707441424:web:59d2f93f60408cd4ca9395',
    messagingSenderId: '876707441424',
    projectId: 'tiktok-mygoofy',
    authDomain: 'tiktok-mygoofy.firebaseapp.com',
    storageBucket: 'tiktok-mygoofy.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjP-MFia9IKrVVJx78ERmIttHHMtFI2MU',
    appId: '1:876707441424:android:fb4c86e730cf7221ca9395',
    messagingSenderId: '876707441424',
    projectId: 'tiktok-mygoofy',
    storageBucket: 'tiktok-mygoofy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZHLFWRsHKaeM9WkbfrRqyfKxyOMhUDT0',
    appId: '1:876707441424:ios:9d5dd46132b092c7ca9395',
    messagingSenderId: '876707441424',
    projectId: 'tiktok-mygoofy',
    storageBucket: 'tiktok-mygoofy.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
