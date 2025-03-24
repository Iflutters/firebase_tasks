import 'package:flutter/material.dart';

import 'app/core/config/config_init.dart';
import 'app/presentation/ui/auth/login_page.dart';
import 'app/presentation/ui/auth/signup_page.dart';

Future<void> main() async {
  await ConfigInit().init();
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch(settings.name){
          case '/signup':
          return MaterialPageRoute(builder: (_) => SignupPage());
          case '/login':
          return MaterialPageRoute(builder: (_) => LoginPage());
          default:
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
      },
    );
  }
}