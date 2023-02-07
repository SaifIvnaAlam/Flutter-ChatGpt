import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isListenting = false;
  String text = "Use the mic to talk";
  SpeechToText speechToText = SpeechToText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListenting,
        duration: const Duration(milliseconds: 2000),
        endRadius: 75.0,
        glowColor: Colors.purpleAccent,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListenting) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListenting = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                    });
                  });
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListenting = false;
            });
          },
          child: CircleAvatar(
            radius: 30,
            child: isListenting
                ? const Icon(Icons.mic)
                : const Icon(Icons.mic_none),
          ),
        ),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
