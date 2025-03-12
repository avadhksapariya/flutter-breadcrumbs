import 'package:flutter/material.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Message Content"),
        ),
      ),
    );
  }
}
