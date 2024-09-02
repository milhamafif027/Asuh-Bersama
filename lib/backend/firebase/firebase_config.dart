import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyApnh5fK9s4cJblRI9z4a6ctCFaw3K7iws",
            authDomain: "r-p-l-kelompok-5-mq8al1.firebaseapp.com",
            projectId: "r-p-l-kelompok-5-mq8al1",
            storageBucket: "r-p-l-kelompok-5-mq8al1.appspot.com",
            messagingSenderId: "765147875170",
            appId: "1:765147875170:web:725081dd53ae3e29970e3b"));
  } else {
    await Firebase.initializeApp();
  }
}
