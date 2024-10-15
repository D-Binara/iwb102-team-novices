import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.8.186:8080/auth'; // Your server base URL

  // Registration API
  Future<Map<String, dynamic>> registerUser({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/register');
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
      return {'success': true, 'message': 'Registration successful', 'data': jsonDecode(response.body)};
    } else {
      return {'success': false, 'message': 'Registration failed: ${response.body}'};
    }
  }

  // Login API
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return {'success': true, 'message': 'Login successful', 'data': jsonDecode(response.body)};
    } else {
      return {'success': false, 'message': 'Login failed: ${response.body}'};
    }
  }
}
