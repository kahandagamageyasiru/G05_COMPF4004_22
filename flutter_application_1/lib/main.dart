import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/providers/user_provider.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/yasiru/2/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51METG3ICA2rU3MeJBVdiGDYNqmDVW1xgZuAvSIUOOwjTfeMovOyvm8JXGd1d8x1IDER8vYcSuTYzo4eJegiIGcD600Bueqh81r';
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
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage2(),
    );
  }
}
