import 'package:firebase_auth/firebase_auth.dart';

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
}
