import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        Login.id: (context) => Login(),
        Logout.id: (context) => Logout(),
      },
    );
  }
}
