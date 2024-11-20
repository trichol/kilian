import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAGHB4sk_Cf89Zsq1a6Fe4x7tXU_QGEy_M",
            authDomain: "kilian-17fe9.firebaseapp.com",
            projectId: "kilian-17fe9",
            storageBucket: "kilian-17fe9.appspot.com",
            messagingSenderId: "580390824355",
            appId: "1:580390824355:web:893494b54b788033941216",
            measurementId: "G-C3CZ2LQRP8"));
  } else {
    await Firebase.initializeApp();
  }
}
