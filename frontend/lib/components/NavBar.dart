import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NabBar extends StatelessWidget {
  const NabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'NavBar',
          style: TextStyle(fontSize: 24), // You can customize the font size and style here
        ),
      ),
    );
  }
}