import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(125.0),
                      bottomRight: Radius.circular(125.0),
                    ),
                  ),
              ),


              SizedBox(height: 30,),
              Text("DAFTAR", style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),

              Text('Nama'),

              Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
                  hintText: "Nama Pengguna",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              ),
              SizedBox(height: 30,),

              Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              ),
              SizedBox(height: 30,),

              Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Kata Sandi",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              ),
              SizedBox(height: 30,),

              Container(
                  height: 56,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Konfirmasi Kata Sandi",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              ),
              SizedBox(height: 30,),

        Container(
          height: 56,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Center(
            child:
            Text("Daftar", style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,

            ),),

          ),
        )

            ],
          ),
      )
    );
  }
}