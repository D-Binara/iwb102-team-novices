import 'package:flutter/material.dart';
import 'package:frontend/components/NavBar.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text(
          "Test",
          style: TextStyle(fontSize: 24), // Adjust as needed
        ),
      ),
    );
  }
}
