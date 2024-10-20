import 'package:flutter/material.dart';
import 'package:frontend/screens/Landing_Page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/services/auth_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
 runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(), // Provide the AuthProvider globally
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(), // This should point to the widget you're working on
    );
  }
}
