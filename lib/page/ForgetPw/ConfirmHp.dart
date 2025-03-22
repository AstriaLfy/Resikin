import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/ForgetPw/OTPCode.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/user_login/regist_form_user.dart';
import 'package:resikin/page//reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/page//loginEmp.dart';
import 'package:resikin/page/ForgetPw/OTPCode.dart';

class Confirmhp extends StatelessWidget {
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
              Text(
                "Masukan No Handphone anda untuk proses verifikasi kami akan mengirimkan kode 4 digit ke No Handphone anda",
                style: GoogleFonts.poppins(fontSize: 14),
              ),

              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 320,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'No.Handphone',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPCode()),
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
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
