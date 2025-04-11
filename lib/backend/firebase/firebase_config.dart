import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAq7iA3JbM2yvOuixyvVO6Pu2SL_AxPDJw",
            authDomain: "fir-wproject-com44b.firebaseapp.com",
            projectId: "s-wproject-com44b",
            storageBucket: "s-wproject-com44b.firebasestorage.app",
            messagingSenderId: "663898282375",
            appId: "1:663898282375:web:8adf49e6a215bf8d6e5b22"));
  } else {
    await Firebase.initializeApp();
  }
}
