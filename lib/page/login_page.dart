import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resikin/page/register_page.dart';
import 'forgot_pw.dart';
import 'beranda.dart';
import 'package:resikin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi email dan password')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    User? user = await _authServices.signInWithEmailAndPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Beranda()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal, periksa email dan password Anda')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(125.0),
                    bottomRight: Radius.circular(125.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 137),
                    Center(
                      child: Text(
                        "MASUK",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(children: [SizedBox(width: 20), Text("Email",style: GoogleFonts.poppins())]),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _emailController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(children: [SizedBox(width: 20), Text("Kata Sandi",style: GoogleFonts.poppins())]),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Kata Sandi",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: _login,
                child: Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Masuk",
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 230),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text("Lupa Password?", style: GoogleFonts.poppins(),),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 56,
                    width: 56,
                    child: Icon(Icons.facebook, size: 56),
                  ),
                  SizedBox(width: 23),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 56,
                    width: 56,
                    child: Icon(Icons.facebook, size: 56),
                  ),
                  SizedBox(width: 23),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 56,
                    width: 56,
                    child: Icon(Icons.facebook, size: 56),
                  ),
                ],
              ),
              SizedBox(height: 110),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?", style: GoogleFonts.poppins()),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      " Daftar",
                      style: GoogleFonts.poppins(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
