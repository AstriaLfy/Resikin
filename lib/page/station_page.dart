import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class StationPage extends StatelessWidget {
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
                  "Station",
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
          child:
          Column(
            children: [
              SizedBox(height: 40),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20)
                ),
                width: 320,
                height: 50,
              ),

              SizedBox(height: 20,),

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
                  height: 100,
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

              SizedBox(height: 20,),

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

              SizedBox(height: 20,),

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

              SizedBox(height: 20,),

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

              SizedBox(height: 20,),

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



            ],
          )

          ,
        )

        ,
      )


    );
  }
}