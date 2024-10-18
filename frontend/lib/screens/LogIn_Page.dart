import 'package:flutter/material.dart';
import 'package:frontend/screens/Register_Page.dart';
import 'package:frontend/services/auth_service.dart';
import 'Home_Page.dart'; // Import HomePage after successful login

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  final AuthService _authService = AuthService(); // Initialize AuthService

  final _formKey = GlobalKey<FormState>(); // Key for form validation

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Hide the keyboard when tapping outside
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[700],
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 3.0,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text('Login', style: TextStyle(fontSize: 16)),
                ),
                Tab(
                  child: Text('Register', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildLoginForm(context),
              const RegisterPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey, // Add form validation key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text('Sign In', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility_outlined,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Main Login Button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    var response = await _authService.loginUser(
                      email: email,
                      password: password,
                    );

                    if (response['success']) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    } else {
                      // Show error dialog in the center of the screen
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Center(
                              child: Text(
                                'Login Failed',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25),
                              ),
                            ),
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5, // 70% of screen width
                              height: MediaQuery.of(context).size.height * 0.03, // 30% of screen height
                              child: const Center(
                                child: Text(
                                  'Invalid Username or Password!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: const Text('OK',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),

              // Add the "OR" divider and social login button after the login button
              const SizedBox(height: 40),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR', style: TextStyle(color: Colors.black)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 40),
              buildSocialLoginButton(
                  'Log In with Google', 'assets/Auth/google.png', Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  // Social Login Button Widget
  Widget buildSocialLoginButton(String text, String logoAsset, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(0.2), // Dark shadow color with opacity
            spreadRadius: 2, // Spread radius of the shadow
            blurRadius: 6, // Blur radius for the shadow softness
            offset: const Offset(0, 3), // Offset for the shadow
          ),
        ],
        borderRadius:
        BorderRadius.circular(10), // Same border radius as the button
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(logoAsset, height: 20), // Set your logo here
        label: Text(
          text,
          style: TextStyle(
            color: bgColor == Colors.white ? Colors.black : Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
