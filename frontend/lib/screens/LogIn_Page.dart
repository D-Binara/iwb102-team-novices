import 'package:flutter/material.dart';
import 'package:frontend/screens/Register_Page.dart';

import 'Home_Page.dart'; // Import your RegisterPage

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // State variable to control password visibility
  bool _isPasswordVisible = false;

  // State variable to control checkbox
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16), // Change the font size here
                ),
              ),
              Tab(
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 16), // Change the font size here
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildLoginForm(context), // This is your login form
            const RegisterPage(), // Replace the center text with RegisterPage
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType:
                  TextInputType.emailAddress, // Sets the input type to email
              autocorrect: false, // Disable autocorrect for email input
              textInputAction:
                  TextInputAction.next, // Allows moving to the next input field
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    const TextStyle(color: Colors.grey), // Default label color
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.green), // Focused border color
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.greenAccent), // Focused error border color
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: !_isPasswordVisible, // Toggle password visibility
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:
                    const TextStyle(color: Colors.grey), // Default label color
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.black), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.green), // Focused border color
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.green), // Focused error border color
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility_outlined,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked, // Use the state variable for checkbox
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!; // Update the checkbox state
                        });
                      },
                      activeColor:
                          Colors.green, // Set the checkbox color to green
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? Click Register"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 40),
            buildSocialLoginButton(
                'LogIn with Google', 'assets/Auth/google.png', Colors.white),
          ],
        ),
      ),
    );
  }

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
}
