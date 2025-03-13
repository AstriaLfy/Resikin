import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';
import 'cleanup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/features/user_auth/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resikin/page/login_page.dart';

void main() {
  runApp(MaterialApp(home: Beranda()));
}

class Beranda extends StatelessWidget {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    User? user = _authServices.getCurrentUser();

    if (user == null) {
      Future.microtask(() {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
      });
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

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
                        IconButton(
                          icon: Icon(Icons.logout, color: Colors.white),
                          onPressed: () async {
                            await _authServices.signOut();
                            Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
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
                      // Background SVG
                      Positioned.fill(
                        child: SvgPicture.asset(
                          "assets/images/RIc.svg",
                          fit:
                              BoxFit
                                  .cover, // Mengatur agar SVG memenuhi container
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
