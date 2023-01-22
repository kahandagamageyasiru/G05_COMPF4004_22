import 'package:flutter/material.dart';
import 'package:flutter_application_1/navidu/paymentgateway/credit_card_page.dart';


class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:
            const Text("Subscription", style: TextStyle(color: Colors.orange)),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 0),
            const Text("Choose your subscription plan:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreditCardPage(),
                ));
              }, 
              child: const Text(
                'Basic',
                style: TextStyle(color: Colors.black, fontSize: 15)
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreditCardPage(),
                ));
              },  
              child: const Text(
                'Premium',
                style: TextStyle(color: Colors.black, fontSize: 15)
                )),
            const SizedBox(height: 20),
           ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreditCardPage(),
                ));
              },  
              child: const Text(
                'Pro',
                style: TextStyle(color: Colors.black, fontSize: 15)
                )),
          ],
        ),
      ),
    );
  }
}
