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
    apiKey: 'AIzaSyCX8zASZnmAtuD-uIa4Qy1HeiA9Zd2QEHc',
    appId: '1:560552763438:web:0774ee451aed34e2377fbf',
    messagingSenderId: '560552763438',
    projectId: 'ecommerce-app-developmen-47370',
    authDomain: 'ecommerce-app-developmen-47370.firebaseapp.com',
    storageBucket: 'ecommerce-app-developmen-47370.appspot.com',
    measurementId: 'G-5MPR8SCK9R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqxeJKgIda7RXHsw6wvCBAZHya1dlHRgk',
    appId: '1:560552763438:android:2e3f715869999dee377fbf',
    messagingSenderId: '560552763438',
    projectId: 'ecommerce-app-developmen-47370',
    storageBucket: 'ecommerce-app-developmen-47370.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKzKi2GtVlqFYVKOcT5pkoBcK1H228jD0',
    appId: '1:560552763438:ios:f6118c1705414903377fbf',
    messagingSenderId: '560552763438',
    projectId: 'ecommerce-app-developmen-47370',
    storageBucket: 'ecommerce-app-developmen-47370.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKzKi2GtVlqFYVKOcT5pkoBcK1H228jD0',
    appId: '1:560552763438:ios:f6118c1705414903377fbf',
    messagingSenderId: '560552763438',
    projectId: 'ecommerce-app-developmen-47370',
    storageBucket: 'ecommerce-app-developmen-47370.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCX8zASZnmAtuD-uIa4Qy1HeiA9Zd2QEHc',
    appId: '1:560552763438:web:f302ca181b61de1b377fbf',
    messagingSenderId: '560552763438',
    projectId: 'ecommerce-app-developmen-47370',
    authDomain: 'ecommerce-app-developmen-47370.firebaseapp.com',
    storageBucket: 'ecommerce-app-developmen-47370.appspot.com',
    measurementId: 'G-7YMKK490KS',
  );
}