import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable.dart';

class ProfilEmp extends StatefulWidget {
  @override
  State<ProfilEmp> createState() => _ProfilEmpState();
}

int _selectedHour = 7;

class _ProfilEmpState extends State<ProfilEmp> {
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
                  "Profile",
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
      body:

    Padding(
    padding: EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * 0.07,
    ),child:
    Column(
      children: [
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          height: 90,
          width: 300,
        ),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Pengaturan Akun")),
        ),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Tentang Kami")),
        ),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Tanya Jawab")),
        ),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Aktifkan Pesanan")),
        ),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Keluar")),
        ),


      ],
    ),
    )




    );
  }
}