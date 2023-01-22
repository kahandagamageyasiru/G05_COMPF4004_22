import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class userdetailsform extends StatefulWidget {
  @override
  userdetailsformstate createState() => userdetailsformstate();
}

class userdetailsformstate extends State<userdetailsform> {
  String goal = 'Daily';
  int weight = 0;
  int height = 0;
  int age = 0;

  final formdets = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Welcome to CrossFit",
          style: TextStyle(color: Color(0xFFFCB040)),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: Form(
          key: formdets,
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Goal',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                iconEnabledColor: Colors.white,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                value: goal,
                onChanged: (newValue) {
                  setState(() {
                    goal = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    child: Text(
                      'Daily',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Daily',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      'Weekly',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Weekly',
                  ),
                  DropdownMenuItem(
                    child: Text(
                      'Monthly',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'Monthly',
                  ),
                ],
                dropdownColor: Colors.black,
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter weight';
                  }
                  return null;
                },
                onSaved: (value) => weight = int.parse(value!),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter height';
                  }
                  return null;
                },
                onSaved: (value) => height = int.parse(value!),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
                onSaved: (value) => age = int.parse(value!),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  submitForm();
                  /*Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => )
                  )*/
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFCB040),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 70,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    if (formdets.currentState!.validate()) {
      formdets.currentState!.save();
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/userdetails'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'goal': goal,
            'weight': weight,
            'height': height,
            'age': age,
          }),
        );

        if (response.statusCode == 201) {
          print('Data saved successfully!');
        } else {
          print('An error occurred while saving data: ${response.statusCode}');
        }
      } catch (error) {
        print('An error occurred while saving data: $error');
      }
    }
  }
}
