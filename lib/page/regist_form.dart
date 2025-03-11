import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resikin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'beranda.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua kolom')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password tidak cocok')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    User? user = await _authServices.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Beranda()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registrasi gagal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("DAFTAR", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600)),
            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(color: Color(0xffd9d9d9), borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.email), hintText: "Email"),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(color: Color(0xffd9d9d9), borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.lock), hintText: "Kata Sandi"),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(color: Color(0xffd9d9d9), borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(border: InputBorder.none, prefixIcon: Icon(Icons.lock), hintText: "Konfirmasi Kata Sandi"),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _register,
              child: Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text("Daftar", style: GoogleFonts.poppins(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
