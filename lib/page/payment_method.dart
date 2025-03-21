import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resikin/features/firestore_database/database_service.dart';
import 'payment_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resikin/features/utility/utils.dart';

class PaymentMethod extends StatefulWidget {
  final String cleaningId;

  const PaymentMethod({Key? key, required this.cleaningId}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final _dbService = DatabaseService();
  double amount = 100000;
  String? _selectedPaymentMethod;
  bool _agreeToUseCoins = false;

  void _processPayment() async {
    await _dbService.createPayment(widget.cleaningId, amount);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );

    Map<String, dynamic> paymentData = {
      'payment_method': _selectedPaymentMethod,
      'use_coins': _agreeToUseCoins,
      'total_price': "Rp. Xxx xxx xxx",
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

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
                        "Cleaning",
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
                    "Luas : 80 m2",
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
                  Text(
                    "Jumlah Pegawai : x",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "Payment Method",
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                height: 66,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Color(0xFFC2DAD5),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.person, size: 40),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text("Cleaning"),
                        SizedBox(height: 5),
                        Text("Rp. 100.000"),
                      ],
                    ),

                    SizedBox(width: 130),

                    GestureDetector(
                      onTap: () {
                        _showConfirmationDialog();
                      },
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 350,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('Resikin Koin'),
                          value: 'Resikin Koin',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Bank BCA'),
                          value: 'Bank BCA',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Bank Mandiri'),
                          value: 'Bank Mandiri',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Gopay'),
                          value: 'Gopay',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Spay'),
                          value: 'Spay',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Color(0xFFC2DAD5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Pakai xxx koin",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                    Switch(
                      value: _agreeToUseCoins,
                      onChanged: (bool value) {
                        setState(() {
                          _agreeToUseCoins = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Harga",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Text(
                      "Rp. Xxx xxx xxx",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                _processPayment();
                navigateTo(context, PaymentPage());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07,
                ),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Text(
                      "BAYAR",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
