// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //App Bar design
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('Social Sharing'),
        titleTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        //automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            exit(0);
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => CreditCardPage()));
          },
        ),
      ),
      body: Chat(messages: _messages, onSendPressed: _handleSendPressed, user: _user),
    );
  }
  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id",
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  

}
  
  

