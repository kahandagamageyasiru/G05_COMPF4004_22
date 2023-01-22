import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'subscription_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51METG3ICA2rU3MeJBVdiGDYNqmDVW1xgZuAvSIUOOwjTfeMovOyvm8JXGd1d8x1IDER8vYcSuTYzo4eJegiIGcD600Bueqh81r'; // Replace with your publishable key
  runApp(const MaterialApp(
    initialRoute: '/',
    //fade in transition
   
    debugShowCheckedModeBanner: false,
    home: SubscriptionPage(),
   
  ),
 );
}

