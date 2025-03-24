import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ConfigInit {
  /*==================================================
    Inicialização Principal
   =================================================*/
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
  }

  /*==================================================
    Inicialização do Firebase
   =================================================*/
  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCK4RPsbrHBK34K2kUVwbXzQla_IOPT7yE',
        appId: '1:150723324933:android:c993171867c16e7f47006c',
        messagingSenderId: '150723324933',
        projectId: 'fir-tasks-adb01',
      ),
    );
  }

  /*==================================================
    Inicialização dos Injectors
  =================================================*/
}
