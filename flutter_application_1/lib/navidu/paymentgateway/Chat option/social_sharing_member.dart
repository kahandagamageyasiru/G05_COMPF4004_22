// ignore_for_file: library_private_types_in_public_api, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/social_sharing_coach.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  _MessagesListScreen createState() => _MessagesListScreen();
}

class _MessagesListScreen extends State<MessagesListScreen> {
  List<Allmessages> messages = <Allmessages>[];

  @override
  void initState() {
    super.initState();
    getmessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('Social Sharing Member Page'),
        titleTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
      ),
       body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(messages[index].message, style: const TextStyle(color: Colors.white),),
            );
          },
        ),
       ),
      );
  }

// getting users from database
  void getmessages() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:5000/memberview"));
    //print(response.body);
    //print('statusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> messagesdata = jsonDecode(response.body);
      setState(() {
        messages = messagesdata
            .map((message) => Allmessages.fromJson(message))
            .toList();
      });
    } else {
      throw Exception('Failed to load messages');
    }
  }
}

class Allmessages {
  String message;

  Allmessages({required this.message});

  factory Allmessages.fromJson(Map<String, dynamic> json) {
    return Allmessages(
      message: json['message'],
    );
  }
}
