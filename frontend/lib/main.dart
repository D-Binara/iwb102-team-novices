import 'package:flutter/material.dart';
import 'package:frontend/screens/Home_Page.dart';
import 'package:frontend/screens/Landing_Page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),  // This should point to the widget you're working on
    );
  }
}