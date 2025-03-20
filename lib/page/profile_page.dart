import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/about_us.dart';
import 'reusable.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
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
                  "Profile",
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
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF3D8D7A)
              ),
              height: 180,
              width: 320,
              child:
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.person, size: 70,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Kelompok9", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
                        Text("kelompok9@gmail.com", style: GoogleFonts.poppins(color: Colors.white),)
                      ],)
                    ],
                  ),

                  Container(
                    height: 96,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1),
                      color: Color(0xFF3D8D7A),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, -4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            "assets/images/RIc.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Text di atas background
                        Center(
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    'Koin Saya',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    '1.864',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              )
              ,
            ),

            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 320,
            ),
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 320,
            ),

            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 320,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()),);

                },
                child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("Tentang Kami", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),)
                    ],
                )
              ),
            ),

            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 320,
            ),

            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.red
              ),
              height: 50,
              width: 320,
              child: Center(
                child: 
                Text("Keluar", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),)
                ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
