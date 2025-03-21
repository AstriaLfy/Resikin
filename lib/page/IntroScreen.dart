import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboarding_page.dart'; // Pastikan untuk mengimpor OnBoardingScreen

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:

        Padding(
        padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
    ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Selamat Datang di\n Resikin',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30,),
            Text(
              'Kelola sampah dengan lebih bijak\n menggunakan Resikin!',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),
            SvgPicture.asset(
              "assets/images/intro.svg",
              height: 200,
            ),
            SizedBox(height: 64),

            SizedBox(height: 70),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()),
                );
              },
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF3D8D7A),
                ),
                child: Center(
                  child: Text(
                    "Mulai",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
          ,
        )


    );
  }
}