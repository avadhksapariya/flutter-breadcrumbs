import 'package:flutter/material.dart';

class ScreenHomework extends StatelessWidget {
  const ScreenHomework({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Homework Content"),
        ),
      ),
    );
  }
}
