import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/regist_form.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/features/utility/utils.dart';

class RegisterPage extends StatelessWidget {
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
                        "DAFTAR",
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
              SizedBox(height: 40),
              SvgPicture.asset("assets/images/signup.svg"),

              GestureDetector(
                onTap: () {
                  navigateTo(context, RegisterForm());
                },
                child: Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFF3D8D7A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Daftar dengan Email",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    child: Divider(thickness: 1, color: Colors.black),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('atau', style: GoogleFonts.poppins()),
                  ),

                  Container(
                    width: 130,
                    child: Divider(thickness: 1, color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 50),

              GestureDetector(
                onTap: () {
                  navigateTo(context, RegisterForm());
                },
                child: ReuseField(
                  color: Color(0xFF3D8D7A),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.phone_android_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Daftar dengan No.HandPhone",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun?"),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, LoginPage());
                    },
                    child: Container(
                      child: Text(
                        " Masuk",
                        style: TextStyle(color: Colors.blue),
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
