import 'package:resikin/features/user_auth/firebase_auth_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'reusable.dart';

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Harap isi email Anda')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await _authServices.sendPasswordResetEmail(email);

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email reset password telah dikirim')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), 
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "Lupa Password",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(children: [
        ],
      ),
    );
  }
}
