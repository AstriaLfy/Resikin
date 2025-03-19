import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'payment_method.dart'; // Import the PaymentMethod page

class Cleanup extends StatefulWidget {
  @override
  _CleanupState createState() => _CleanupState();
}

class _CleanupState extends State<Cleanup> {
  final TextEditingController luasController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  int jumlahPegawai = 1; // Initialize the number of employees
  final TextEditingController catatanController = TextEditingController();

  void _setJadwal() {
    // Handle the scheduling logic here
    String luas = luasController.text;
    String alamat = alamatController.text;
    String catatan = catatanController.text;

    // You can add your logic to save or process the data
    print("Luas: $luas");
    print("Alamat: $alamat");
    print("Jumlah Pegawai: $jumlahPegawai");
    print("Catatan: $catatan");

    // Navigate to the PaymentMethod page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentMethod()),
    );
  }

  void _incrementPegawai() {
    if (jumlahPegawai < 3) {
      setState(() {
        jumlahPegawai++;
      });
    }
  }

  void _decrementPegawai() {
    if (jumlahPegawai > 1) {
      setState(() {
        jumlahPegawai--;
      });
    }
  }

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
                  "Cleaning",
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
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "Kapan mau cleaning?",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDateButton("Hari Ini"),
                SizedBox(width: 5),
                _buildDateButton("Besok"),
                SizedBox(width: 5),
                _buildDateButton("Pilih Tanggal"),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                width: 310,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SvgPicture.asset(
                    "assets/images/timeBg.svg",
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            _buildInputField("Luas", luasController, 50),
            SizedBox(height: 10),
            _buildInputField("Alamat", alamatController, 60),
            SizedBox(height: 10),
            _buildEmployeeCount(), // Employee count widget
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 25),
                Text(
                  "Catatan",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
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
                width: 340,
                height: 100,
                child: TextField(
                  controller: catatanController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Catatan...",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton("Batal", Colors.white, Colors.black, () {
                    // Handle cancel action
                  }),
                  SizedBox(width: 20),
                  _buildActionButton("Set Jadwal", Colors.teal, Colors.white, _setJadwal),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal,
        border: Border.all(color: Colors.black, width: 1),
      ),
      width: 100,
      height: 56,
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, double height) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 25),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 1),
            ),
            height: height,
            width: 340,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Masukkan $label",
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Jumlah Pegawai", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16)),
        SizedBox(width: 70),
        Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: _decrementPegawai,
              ),
              Text("$jumlahPegawai", style: GoogleFonts.poppins(color: Colors.white)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: _incrementPegawai,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String title, Color bgColor, Color textColor, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1),
      ),
      height: 50,
      width: 140,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}