import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners(); // Update UI ketika status berubah
      print("Auth state changed: ${user?.email}");
    });
  }

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
    print("User signed out");
  }
}
