import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/bottomnavbar.dart';
import 'package:resikin/page/beranda.dart';
import 'package:resikin/page/register_page.dart';
import 'forgot_pw.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCF9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ReusableContainer(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 112),
                      Text(
                        "MASUK",
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

              SizedBox(height: 10),
              SvgPicture.asset("assets/images/Login.svg"),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Email", style: GoogleFonts.poppins()),
                ],
              ),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Kata Sandi", style: GoogleFonts.poppins()),
                ],
              ),
              Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Kata Sandi",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),


              ),
              SizedBox(height: 15),

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
                    child: Text("Lupa Password?", style: GoogleFonts.poppins()),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => BottomNavigationPage()));
                },
                child: Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFF3D8D7A),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),

                  ),
                  child: Center(
                    child: Text(
                      "Masuk",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                height: 56,
                width: 320,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/google.svg"),
                    SizedBox(width: 10),
                    Text(
                      "Masuk dengan Google",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 23),

              SizedBox(height: 10),
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
                    child: Container(
                      child: Text(
                        " Daftar",
                        style: GoogleFonts.poppins(color: Colors.blue),
                      ),
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
