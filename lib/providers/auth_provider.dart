import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _currentUser;
  
  String? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  void login(String phone, String password) {
    _currentUser = phone;
    notifyListeners();
  }

  void register(String phone, String password, String name) {
    _currentUser = phone;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}