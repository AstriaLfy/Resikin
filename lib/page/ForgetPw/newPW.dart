import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/ForgetPw/OTPCode.dart';
import 'package:resikin/page/login_as.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCF9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "Lupa Kata Sandi",
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              SvgPicture.asset("assets/images/lock.svg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Masukan Email anda untuk proses verifikasi. Kami akan mengirimkan kode 4 digit ke Email anda.",
                  style: GoogleFonts.poppins(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              _buildInputField('Kata Sandi Baru'),
              SizedBox(height: 30),
              _buildInputField('Konfirmasi Kata Sandi Baru'),
              SizedBox(height: 30),
              _buildNextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        obscureText: hintText.contains('Kata Sandi'), 
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginAs()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal,
        ),
        width: 320,
        height: 50,
        child: Center(
          child: Text(
            "Lanjut",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}