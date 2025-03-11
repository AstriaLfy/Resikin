import 'package:flutter/material.dart';
import 'package:resikin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _resetPassword() async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Harap isi email Anda')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await _authServices.sendPasswordResetEmail(email);

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email reset password telah dikirim')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: "Masukkan Email")),
          ElevatedButton(onPressed: _resetPassword, child: _isLoading ? CircularProgressIndicator() : Text("Kirim Link Reset Password"))
        ],
      ),
    );
  }
}
