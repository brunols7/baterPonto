import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBMeaOrTm4b2R3SrwSbzwNBgYd8sL7ba20",
            authDomain: "bater-ponto-077yfs.firebaseapp.com",
            projectId: "bater-ponto-077yfs",
            storageBucket: "bater-ponto-077yfs.appspot.com",
            messagingSenderId: "588212487126",
            appId: "1:588212487126:web:cc8a17cb0b37fd34191a77"));
  } else {
    await Firebase.initializeApp();
  }
}
