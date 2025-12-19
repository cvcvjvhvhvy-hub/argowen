import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDxKZ8Q9X7Y2V3W4U5T6R7E8I9O0P1A2S3',
    appId: '1:123456789012:web:abcdef123456789',
    messagingSenderId: '123456789012',
    projectId: 'order-management-app-2024',
    authDomain: 'order-management-app-2024.firebaseapp.com',
    storageBucket: 'order-management-app-2024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbCdEfGhIjKlMnOpQrStUvWxYz123456789',
    appId: '1:123456789012:android:abcdef123456789',
    messagingSenderId: '123456789012',
    projectId: 'order-management-app-2024',
    storageBucket: 'order-management-app-2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcDeFgHiJkLmNoPqRsTuVwXyZ123456789',
    appId: '1:123456789012:ios:abcdef123456789',
    messagingSenderId: '123456789012',
    projectId: 'order-management-app-2024',
    storageBucket: 'order-management-app-2024.appspot.com',
    iosBundleId: 'com.example.orderManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'your-macos-api-key',
    appId: 'your-macos-app-id',
    messagingSenderId: 'your-sender-id',
    projectId: 'your-project-id',
    storageBucket: 'your-project-id.appspot.com',
    iosBundleId: 'com.example.orderManagementApp',
  );
}