import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirebaseAuthServices {
  static final FirebaseAuthServices _instance =
      FirebaseAuthServices._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  factory FirebaseAuthServices() {
    return _instance;
  }

  FirebaseAuthServices._internal();

  //Validasi Email Address
  bool validateEmailAddress(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  //Validasi Password Minimal 8
  bool validatePassword(String password) {
    return password.length >= 8;
  }

  //Sign Up Email
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (!validateEmailAddress(email)) {
      print('Invalid email format');
      return null;
    }
    if (!validatePassword(password)) {
      print('Password must be at least 8 characters');
      return null;
    }

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed up: ${credential.user?.uid}');
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak. Please try again');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      print("some error occured");
    }
    return null;
  }

  //Sign In Email
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (!validateEmailAddress(email)) {
      print('Invalid email format');
      return null;
    }
    if (!validatePassword(password)) {
      print('Password must be at least 8 characters');
      return null;
    }

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed in: ${credential.user?.uid}');
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      print("some error occured");
    }
    return null;
  }

  //Sign Out Email
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  //Mendapatkan user yang login
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Mengirim email untuk reset password
  Future<void> sendPasswordResetEmail(String email) async {
    if (!validateEmailAddress(email)) {
      print('Invalid email address');
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent to $email');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Update email
  Future<void> updateEmail(String newEmail) async {
    if (!validateEmailAddress(newEmail)) {
      print('Invalid email format');
      return;
    }

    try {
      await _auth.currentUser?.updateEmail(newEmail);
      print('Email updated to $newEmail');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Update password
  Future<void> updatePassword(String newPassword) async {
    if (!validatePassword(newPassword)) {
      print('Password must be at least 6 characters');
      return;
    }

    try {
      await _auth.currentUser?.updatePassword(newPassword);
      print('Password updated');
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}

