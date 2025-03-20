import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:resikin/page/history_page.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/profile_page.dart';
import 'package:resikin/page/station_page.dart';
import 'reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cleanup.dart';

void main() {
  runApp(MaterialApp(home: Beranda()));
}

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Container(
          child: Stack(
            children: [
              Container(height: 220),

              ReusableContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 175, width: 30),
                        Text(
                          "Halo, Kelompok9",
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 70),
                        Icon(Icons.notifications, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120, // Adjusted position for top
                left: 25, // Adjusted position for left
                right: 25, // Added right positioning
                child: Container(
                  height: 96,
                  width: double.infinity,
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
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                height: 96,
                width: 350,
                child: Column(
                  children: [
                    Text(
                      "Jadwal Pengangkutan Sampah",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 270, // Adjust the width as needed
                      child: Divider(thickness: 1, color: Colors.black),
                    ),

                    Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.access_time_rounded),
                        Text("Jam: 00:00"),
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.location_on_sharp),
                        Text("Alamat: Fakultas Ilmu Komputer"),
                      ],
                    ),
                  ],
                ),
              ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Cleanup()));
                  },
                  child: Container(
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
                  child: 
                  Center(
                    child: 
                    Text("Week"),
                  )
                  ,
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
                    child:
                    Center(
                      child:
                      Text("Month"),
                    )
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
                    child:
                    Center(
                      child:
                      Text("Year"),
                    )
                ),
              ],
            ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child:
          Container(
              height: 280,
              width: 305,
              child: SvgPicture.asset("assets/images/diagramThn.svg")
          ),
        ),


            SizedBox(height: 20),

            Row(
              children: [
                SizedBox(width: 30,),

                Text(
                  "Artikel",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              ],
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 161,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                                color: Colors.teal,
                              ),
                              height: 80,
                              width: 160,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
