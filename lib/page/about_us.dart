import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Height of AppBar
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text(
                  "About Us",
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
      body: Center(
        child:
        Column(
          children: [
            SizedBox(height: 40,),
            SvgPicture.asset("assets/images/logoAboutus.svg"),

            Container(
              height: 400,
              width: 330,
              child:
              SingleChildScrollView(
                child: Text(
                  "Resikin adalah solusi cerdas untuk mengatasi permasalahan sampah di Kota Malang. Kami hadir untuk membantu masyarakat mengelola sampah dengan lebih efisien melalui empat fitur utama: jadwal angkut sampah, layanan cleaning service, reservasi pengangkutan sampah, serta drop-off di bank sampah. Dengan Resikin, kebersihan kota bukan lagi sekadar wacana—tapi aksi nyata!\n\n"
                      "Aplikasi ini dikembangkan oleh Team 9 Internship Raion dalam waktu satu bulan, beranggotakan:\n"
                      "✅ Ana Zahratul Firdausi\n"
                      "✅ Muhammad Sulthon Aulia Wijaya\n"
                      "✅ Muhammad Raffi\n"
                      "✅ Muhammad Ihsan Fadillah\n"
                      "✅ Muhammad Fahry Pratama Putra\n"
                      "✅ Mohammad Rozan Hanan\n"
                      "Kami percaya bahwa perubahan dimulai dari langkah kecil. Bersama ResiKin, mari wujudkan Kota Malang yang lebih bersih dan lestari! 🌿♻️",
                  style: GoogleFonts.poppins(fontSize: 16), // Mengatur ukuran font
                )
                ,
              )
              ,
            )




          ],
        ),
      )




    );
  }
}
