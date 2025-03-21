import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class Faq extends StatelessWidget {
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
                SizedBox(height: 112),
                Text(
                  "FAQ",
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
      body:
      Padding(
      padding: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.07,
    ),child:
      Column(
          children: [

            SizedBox(height: 20,),
            Text("Cari Masalah yang lagi kamu alami", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),),
            SizedBox(height: 30,),

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
                  hintText: 'Ketik 2 Karakter atau lebih',
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Topik Yang sering di cari", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),),
            SizedBox(height: 20,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              height: 90,
            child:             Text("Bagaimana cara melihat jadwal pengangkutan sampah di area saya?", style: GoogleFonts.poppins( fontSize: 16),),

            ),

            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              height: 90,
              child:             Text("Di mana saya bisa menemukan bank sampah ?", style: GoogleFonts.poppins( fontSize: 16),),

            ),
            SizedBox(height: 20,),


            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              height: 90,
              child:             Text("Apa yang harus saya lakukan jika saya membutuhkan pengangkutan sampah di luar jadwal reguler?", style: GoogleFonts.poppins( fontSize: 16),),

            ),

          ]
      )

      )



    );
  }
}