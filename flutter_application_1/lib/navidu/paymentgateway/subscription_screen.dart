import 'package:flutter/material.dart';
import 'payment_controller.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Subscription", style: TextStyle(color: Colors.orange)),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),


      body:  Container(
      color: Colors.black,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 0),
          const Text("Choose your subscription plan:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(height: 20),
          _subscriptionButton("Basic", "5.99"),
          const SizedBox(height: 20),
          _subscriptionButton("Premium", "9.99"),
          const SizedBox(height: 20),
          _subscriptionButton("Pro", "100"),
        ],
      ),
      ),
    );
  }

  Widget _subscriptionButton(String label, String amount) {
    final paymentController = PaymentController(); 
    return InkWell(
      onTap: () async {
        await PaymentController().makePayment(amount: '100', currency: 'USD', label: label);
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 232, 107, 13),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}


