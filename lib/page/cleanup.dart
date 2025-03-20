import 'package:resikin/features/firestore_database/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:resikin/features/calendar/calendar_dialog.dart';
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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();

  final TextEditingController luasController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  int jumlahPegawai = 1;
  final TextEditingController catatanController = TextEditingController();

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

  void _setJadwal() {
    String luas = luasController.text;
    String alamat = alamatController.text;
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

void _showCalendarDialog() {
  showDialog(
    context: context,
    builder: (context) => CalendarDialog(
      focusedDay: focusedDay,
      onDateSelected: (selectedDate) {
        setState(() {
          this.selectedDate = selectedDate;
          selectedDay = DateFormat('yyyy-MM-dd').format(selectedDate);
        });
      },
    ),
  );
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
                _buildDateButton("Pilih Tanggal", () => _showCalendarDialog()),
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
            SizedBox(height: 20),
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
        Text(
          "Jumlah Pegawai",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
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
              Text(
                "$jumlahPegawai",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
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
