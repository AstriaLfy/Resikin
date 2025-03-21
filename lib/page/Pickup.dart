import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'payment_method.dart'; // Import the PaymentMethod page

class Pickup extends StatefulWidget {
  @override
  _Pickup createState() => _Pickup();
}

class _Pickup extends State<Pickup> {
  final TextEditingController luasController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  int jumlahPegawai = 1;
  final TextEditingController catatanController = TextEditingController();
  int _selectedHour = 7;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            child: Container(
              height: 450,
              width: 700,
              padding: EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Pickup",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 105),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Tanggal : Hari ini",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),

                  SizedBox(height: 5),
                  Text(
                    "Berat : 80 Kg",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),

                  SizedBox(height: 5),

                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start, // Menyelaraskan teks di bagian atas
                    children: [
                      Text(
                        "Alamat : ",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start, // Menyelaraskan teks alamat ke kiri
                          children: [
                            Text(
                              "Ruang A1 No.19,\n"
                                  "Ketawanggede,\n"
                                  "Kec. Lowokwaru\n"
                                  "Kota Malang,\n"
                                  "Jawa Timur 65145",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start, // Menyelaraskan teks di bagian atas
                    children: [
                      Text(
                        "Catatan : ",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start, // Menyelaraskan teks alamat ke kiri
                          children: [
                            Text(
                              "xxxxxxxxx,\n"
                                  "xxxxxxx,\n"
                                  "xxxxxxxxxxxxxx\n"
                                  "xxxxxxxxxxxxxx,\n"
                                  "xxxxxxxxxxxxxxx",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 45),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentMethod(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.teal,
                          ),
                          width: 70,
                          height: 30,
                          child: Center(
                            child: Text(
                              "Bayar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _setJadwal() {
    String luas = luasController.text;
    String alamat = alamatController.text;
    String catatan = catatanController.text;
    _showConfirmationDialog();

    print("Luas: $luas");
    print("Alamat: $alamat");
    print("Jumlah Pegawai: $jumlahPegawai");
    print("Catatan: $catatan");
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
                "Kapan mau Pickup?",
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
                  child: Stack(
                    children: [
                      SvgPicture.asset("assets/images/timeBg.svg", fit: BoxFit.cover),
                      Center(
                        child: Container(
                          height: 80, // Tinggi dari wheel
                          child: ListWheelScrollView(
                            itemExtent: 50, // Tinggi setiap item
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _selectedHour = index + 7; // Mengubah jam yang dipilih
                              });
                            },
                            children: List.generate(10, (index) {
                              return Center(
                                child: Text(
                                  '${index + 7}:00', // Menampilkan jam dari 07:00 hingga 16:00
                                  style: TextStyle(fontSize: 24, color: Colors.white),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            _buildInputField("Berat", luasController, 50),
            SizedBox(height: 10),
            _buildInputField("Alamat", alamatController, 60),
            SizedBox(height: 10),
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
                  _buildActionButton("Batal", Colors.white, Colors.black, () {
                    Navigator.pop(context);
                  }),
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

  Widget _buildDateButton(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal,
        border: Border.all(color: Colors.black, width: 1),
      ),
      width: 100,
      height: 56,
      child: Center(child: Text(title, style: TextStyle(color: Colors.white))),
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
