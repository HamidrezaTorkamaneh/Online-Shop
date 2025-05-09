import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final String username;

  TestScreen(this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          username,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
