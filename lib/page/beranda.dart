import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(home: Beranda()));
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(height: 220),

                  ReusableContainer(),

                  Positioned(
                    top: 120, // Adjusted position for top
                    left: 25, // Adjusted position for left
                    right: 25, // Added right positioning
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                      height: 96,
                      width: double.infinity,
                      child: SvgPicture.asset("assets/images/RIc.svg"),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1),
              ),
              height: 96,
              width: 304,
            ),

            SizedBox(height: 20),
            Text(
              "Informasi sampah daur ulang Resik.in",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 300, // Adjust the width as needed
              child: Divider(thickness: 1, color: Colors.black),
            ),

            Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.soap),
                Text("Kaleng"),

                SizedBox(width: 80),

                Icon(Icons.water_drop_outlined),
                Text("Plastik"),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.soap),
                Text("Botol Kaca"),

                SizedBox(width: 55),

                Icon(Icons.water_drop_outlined),
                Text("Kertas/Kardus"),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //CONTAINER CLEAN UP
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background container
                      Container(
                        width: 142,
                        height: 130,
                        decoration: BoxDecoration(),
                      ),

                      // Positioned teal container
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal,
                          ),
                          height: 122,
                          width: 142,
                        ),
                      ),

                      // Positioned image overlay
                      Positioned(
                        top: -5, // Adjust this value to move the image up
                        left: 0, // Center the image horizontally if needed
                        right: 0, // Center the image horizontally if needed
                        child: SvgPicture.asset(
                          'assets/images/clean.svg',
                          fit: BoxFit.contain, // Adjust the fit as needed
                        ),
                      ),

                      // Positioned bottom container
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 44,
                          width: 142,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Clean Up",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 20),

                //CONTAINER PICKUP
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background container
                      Container(
                        width: 142,
                        height: 130,
                        decoration: BoxDecoration(),
                      ),

                      // Positioned teal container
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal,
                          ),
                          height: 122,
                          width: 142,
                        ),
                      ),

                      // Positioned image overlay
                      Positioned(
                        top: -4, // Adjust this value to move the image up
                        left: 0, // Center the image horizontally if needed
                        right: 0, // Center the image horizontally if needed
                        child: SvgPicture.asset(
                          'assets/images/deliv.svg',
                          fit: BoxFit.contain, // Adjust the fit as needed
                        ),
                      ),

                      // Positioned bottom container
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 44,
                          width: 142,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Pick Up",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Row(
              children: [
                SizedBox(width: 30),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),

                SizedBox(width: 10),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Container(
              height: 300,
              width: 305,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Text("Diagram"),
            ),
            SizedBox(height: 20),
            Text(
              "Artikel",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 161,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Center(
                        child: Text(
                          'Item $index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
