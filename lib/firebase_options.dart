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
    apiKey: 'AIzaSyBPt2pRqnwmBf73Kj5cQvIWg_GEiu_0jDs',
    appId: '1:567482847285:web:c88c2697d3d5ab9352a17c',
    messagingSenderId: '567482847285',
    projectId: 'restaurant-app-86fbc',
    authDomain: 'restaurant-app-86fbc.firebaseapp.com',
    storageBucket: 'restaurant-app-86fbc.appspot.com',
    measurementId: 'G-Y47TW8LMDV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC1FGB45-t4FgqigPt8tXELsvEgumva-c',
    appId: '1:567482847285:android:2c48cc1ea432053c52a17c',
    messagingSenderId: '567482847285',
    projectId: 'restaurant-app-86fbc',
    storageBucket: 'restaurant-app-86fbc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkJI76OQl7XptM6ruaJm1vGQnzaC5ypWE',
    appId: '1:567482847285:ios:73313809affab42652a17c',
    messagingSenderId: '567482847285',
    projectId: 'restaurant-app-86fbc',
    storageBucket: 'restaurant-app-86fbc.appspot.com',
    iosBundleId: 'com.example.restaurantApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkJI76OQl7XptM6ruaJm1vGQnzaC5ypWE',
    appId: '1:567482847285:ios:73313809affab42652a17c',
    messagingSenderId: '567482847285',
    projectId: 'restaurant-app-86fbc',
    storageBucket: 'restaurant-app-86fbc.appspot.com',
    iosBundleId: 'com.example.restaurantApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPt2pRqnwmBf73Kj5cQvIWg_GEiu_0jDs',
    appId: '1:567482847285:web:eb3023863041b1d552a17c',
    messagingSenderId: '567482847285',
    projectId: 'restaurant-app-86fbc',
    authDomain: 'restaurant-app-86fbc.firebaseapp.com',
    storageBucket: 'restaurant-app-86fbc.appspot.com',
    measurementId: 'G-TFNTB3T6MK',
  );
}
