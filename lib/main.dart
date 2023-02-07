import 'package:chat_gpt/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatGpt());
}

class ChatGpt extends StatelessWidget {
  const ChatGpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
