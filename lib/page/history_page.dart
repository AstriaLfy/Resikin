import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String _selectedCategory = "Aktif"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Height of AppBar
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 70),
                Text(
                  "Riwayat",
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
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = "Aktif";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 18.0,
                  ),
                  decoration: BoxDecoration(
                    color:
                        _selectedCategory == "Aktif"
                            ? Colors.teal
                            : Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 1)
                  ),
                  height: 45,
                  width: 150,
                  child: Text(
                    "Pesanan Aktif",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color:
                          _selectedCategory == "Aktif"
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = "Riwayat";
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 18.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color:
                        _selectedCategory == "Riwayat"
                            ? Colors.teal
                            : Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 45,
                  width: 150,
                  child: Text(
                    "Riwayat Pesanan",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color:
                          _selectedCategory == "Riwayat"
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09,
              ),
              child: Container(
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE2EDEA),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: SingleChildScrollView(
                  child:
                      _selectedCategory == "Aktif"
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pesanan Aktif.",
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          )
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Riwayat Pesanan.",
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 10,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 150,
                                width: 284,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        SvgPicture.asset(
                                          "assets/images/PickIcon.svg",
                                        ),
                                        SizedBox(width: 10),
                                        Text("Pick Up"),
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.calendar_month),
                                        Text("Tanggal : 00 Maret 2025"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.location_on),
                                        Text("Alamat : xxxxxxxxx"),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.monitor_weight),
                                        Text("00 Kg"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}