import 'package:flutter/material.dart';

class ScreenContactUs extends StatelessWidget {
  const ScreenContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ContactUs"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("ContactUs Content"), //hr@aipxperts.com
        ),
      ),
    );
  }
}
