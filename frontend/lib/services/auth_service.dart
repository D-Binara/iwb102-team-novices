import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class AuthService {
  final String authUrl = '${dotenv.env['BASE_URL']}/auth';

  // Registration API
  Future<Map<String, dynamic>> registerUser({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$authUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return {
        'success': true,
        'message': 'Registration successful',
        'data': jsonDecode(response.body)
      };
    } else {
      return {
        'success': false,
        'message': 'Registration failed: ${response.body}'
      };
    }
  }

  // Login API
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final url = Uri.parse('$authUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Parse user data from response
      final responseData = jsonDecode(response.body);
      final userMessage = responseData['message'];

      final firstname = userMessage['firstname'] ?? 'Unknown';
      final lastname = userMessage['lastname'] ?? 'Unknown';

      // Store user information in AuthProvider
      Provider.of<AuthProvider>(context, listen: false)
          .login(firstname, lastname, email);

      return {
        'success': true,
        'message': 'Login successful',
        'data': responseData
      };
    } else {
      return {'success': false, 'message': 'Login failed: ${response.body}'};
    }
  }
}
