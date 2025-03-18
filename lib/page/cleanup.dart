import 'package:resikin/features/firestore_database/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resikin/page/reusable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'payment_method.dart';

class Cleanup extends StatefulWidget {
  @override
  _CleanupState createState() => _CleanupState();
}

class _CleanupState extends State<Cleanup> {
  final _dbService = DatabaseService();
  String selectedDay = "Hari ini";
  DateTime? selectedDate;
  String? selectedDocId;

  final TextEditingController luasController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController jumlahPegawaiController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  void _setJadwal() {
    String luas = luasController.text;
    String alamat = alamatController.text;
    String jumlahPegawai = jumlahPegawaiController.text;
    String catatan = catatanController.text;

    Map<String, dynamic> data = {
      'luas': luas,
      'alamat': alamat,
      'jumlah_pegawai': jumlahPegawai,
      'catatan': catatan,
      'tanggal': selectedDay,
      'timestamp': FieldValue.serverTimestamp(),
    };

    _dbService
        .createClean(data)
        .then((_) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentMethod()),
          );
        })
        .catchError((error) {
          print("Error adding data: $error");
        });
  }

  void _selectDate(String day) {
    setState(() {
      selectedDay = day;
    });

    if (day == "Pilih Tanggal") {
      _pickDate();
    }
  }

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        selectedDay = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
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
                _buildDateButton("Hari Ini", () => _selectDate("Hari Ini")),
                SizedBox(width: 5),
                _buildDateButton("Besok", () => _selectDate("Besok")),
                SizedBox(width: 5),
                _buildDateButton("Pilih Tanggal", () {
                  // Implement date picker if needed
                }),
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
                  child: SvgPicture.asset("assets/images/timeBg.svg"),
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
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
                  _buildActionButton(
                    "Batal",
                    Colors.white,
                    Colors.black,
                    () {},
                  ),
                  SizedBox(width: 20),
                  _buildActionButton(
                    "Set Jadwal",
                    Colors.teal,
                    Colors.white,
                    _setJadwal,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(String title, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    double height,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
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

  Widget _buildActionButton(
    String title,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
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
