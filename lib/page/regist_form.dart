import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resikin/features/user_auth/firebase_auth_services.dart';
import 'package:resikin/features/firestore_database/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'reusable.dart';
import 'package:resikin/bottomnavbar.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _dbService = DatabaseService();
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    String? errorMessage = await _authServices.signUpWithEmailAndPassword(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _confirmPasswordController.text.trim(),
    );

    if (errorMessage == null) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _dbService.createUserLogin({
          "uid": user.uid,
          "name": _nameController.text.trim(),
          "email": _emailController.text.trim(),
          "password": _passwordController.text.trim(),
          "confirmPassword": _confirmPasswordController.text.trim(),
          "created_at": FieldValue.serverTimestamp(),
        });
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigationPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableContainer(),

            SizedBox(height: 30),
            Text(
              "DAFTAR",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),

            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
                  hintText: "Nama Pengguna",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),

            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),

            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Kata Sandi",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),

            Container(
              height: 56,
              width: 320,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Konfirmasi Kata Sandi",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(320, 56),
              ),
              child:
                  _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                        "Daftar",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
