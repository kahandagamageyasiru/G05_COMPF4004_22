import 'package:flutter/material.dart';
import 'package:flutter_application_1/dhanish/Login_signup/providers/user_provider.dart';
import 'package:flutter_application_1/dhanish/Login_signup/screens/home_screen.dart';
import 'package:flutter_application_1/dhanish/Login_signup/screens/signup_screen.dart';
import 'package:flutter_application_1/dhanish/Login_signup/screens/splash_screen.dart';
import 'package:flutter_application_1/dhanish/Login_signup/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Node Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
