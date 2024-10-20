import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _firstname;
  String? _lastname;
  String? _email;

  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get email => _email;

  bool get isLoggedIn => _email != null;

  // Method to save user information when they log in
  void login(String firstname, String lastname, String email) {
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    notifyListeners();
  }

  // Method to clear user information when they log out
  void logout() {
    _firstname = null;
    _lastname = null;
    _email = null;
    notifyListeners();
  }
}
