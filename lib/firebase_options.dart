// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnzPnA2miSk_kKXLRjYjC-vGW_rJiS5lc',
    appId: '1:390414775798:web:6810689181c30e01aa03d7',
    messagingSenderId: '390414775798',
    projectId: 'prokit-flutter',
    authDomain: 'prokit-flutter.firebaseapp.com',
    databaseURL: 'https://prokit-flutter.firebaseio.com',
    storageBucket: 'prokit-flutter.appspot.com',
    measurementId: 'G-98QQYB8513',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1vaXshOIow78NIncu3DhMkKt_DjbCuAE',
    appId: '1:390414775798:android:5028b0288e73a744aa03d7',
    messagingSenderId: '390414775798',
    projectId: 'prokit-flutter',
    //databaseURL: '',
    storageBucket: 'prokit-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXwrvHeNNlPATLzslJq8uiekfe-inNs4E',
    appId: '390414775798-3r3pnimk1j59ihshvfhgppf72tfs79e0.apps.googleusercontent.com',
    messagingSenderId: '390414775798',
    projectId: 'prokit-flutter',
    databaseURL: 'https://prokit-flutter.firebaseio.com',
    storageBucket: 'prokit-flutter.appspot.com',
    androidClientId: '390414775798-2ibul2qkkkmba1ob0r1cjnkbiq4lnrpg.apps.googleusercontent.com',
    iosClientId: '390414775798-3r3pnimk1j59ihshvfhgppf72tfs79e0.apps.googleusercontent.com',
    iosBundleId: 'com.iqonic.prokitflutter1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '390414775798-3r3pnimk1j59ihshvfhgppf72tfs79e0.apps.googleusercontent.com',
    messagingSenderId: '390414775798',
    projectId: 'prokit-flutter',
    databaseURL: 'https://prokit-flutter.firebaseio.com',
    storageBucket: 'prokit-flutter.appspot.com',
    androidClientId: '390414775798-2ibul2qkkkmba1ob0r1cjnkbiq4lnrpg.apps.googleusercontent.com',
    iosClientId: '390414775798-3r3pnimk1j59ihshvfhgppf72tfs79e0.apps.googleusercontent.com',
    iosBundleId: 'com.iqonic.prokitflutter1',
  );
}
