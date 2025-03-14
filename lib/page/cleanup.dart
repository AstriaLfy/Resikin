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
  final TextEditingController jumlahPegawaiController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  void _setJadwal() {
    // Handle the scheduling logic here
    String luas = luasController.text;
    String alamat = alamatController.text;
    String jumlahPegawai = jumlahPegawaiController.text;
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
                  borderRadius: BorderRadius.circular(20), // Ensure the SVG respects the border radius
                  child: SvgPicture.asset(
                    "assets/images/cleanhed.svg",
                    fit: BoxFit.cover, // This will make the SVG fill the container
                  ),
                ),
              ),
            ),
            _buildInputField("Luas", luasController, 40),
            _buildInputField("Alamat", alamatController, 60),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Jumlah Pegawai"),
                SizedBox(width: 80),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  height: 44,
                  width: 120,
                  child: TextField(
                    controller: jumlahPegawaiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Jumlah",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Catatan"),
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
                    hintText: "Catatan",
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
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
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