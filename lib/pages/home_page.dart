import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isListenting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: false,
        duration: const Duration(milliseconds: 2000),
        endRadius: 75.0,
        glowColor: Colors.purpleAccent,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onTapDown: (details) {
            setState(() {
              isListenting = true;
            });
          },
          onTapUp: (details) {
            setState(() {
              isListenting = false;
            });
          },
          child: const CircleAvatar(
            radius: 30,
            child: Icon(Icons.mic),
          ),
        ),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
