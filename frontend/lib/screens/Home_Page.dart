import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: const Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24), // You can customize the font size and style here
        ),
      ),
    );
  }
}
