import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class StationPage extends StatefulWidget {
  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
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
          child: Column(
            children: [
              SizedBox(height: 40),

              // Search Bar Container
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
                    hintText: 'Search Station...',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Station Cards
              _buildStationCard("Station Suhat", "Jam: 00:00", "Alamat: Fakultas Ilmu Komputer"),
              SizedBox(height: 20),
              _buildStationCard("Station FILKOM", "Jam: 00:00", "Alamat: Fakultas Ilmu Komputer"),
              SizedBox(height: 20),
              _buildStationCard("Station blbabla", "Jam: 00:00", "Alamat: Fakultas Ilmu Komputer"),
              SizedBox(height: 20),
              _buildStationCard("Station blbabla", "Jam: 00:00", "Alamat: Fakultas Ilmu Komputer"),
              SizedBox(height: 20),
              _buildStationCard("Station blbabla", "Jam: 00:00", "Alamat: Fakultas Ilmu Komputer"),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu stasiun
  Widget _buildStationCard(String stationName, String time, String address) {
    return Padding(
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
              stationName,
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
                Text(time),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.location_on_sharp),
                Text(address),
              ],
            ),
          ],
        ),
      ),
    );
  }
}