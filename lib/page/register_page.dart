import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/login_page.dart';
import 'package:resikin/page/regist_form.dart';
import 'reusable.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: [
            ReusableContainer(child: Center(
                child:
                Column(
                  children: [
                    SizedBox(height: 137,),
                    Text("MASUK", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600,
                    ),),
                  ],
                )

            )
            ),
            SizedBox(height: 40,),


            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterForm()));


              },child:
            Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.email),
                    SizedBox(width: 10,),
                    Text("Daftar dengan Email",style: GoogleFonts.poppins()),

                  ],
                )
            ),

            ),



            SizedBox(height: 50,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130, // Adjust the width as needed
                child: Divider(thickness: 1, color: Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('atau', style: GoogleFonts.poppins(),), ),


              Container(
                width: 130, // Adjust the width as needed
                child: Divider(thickness: 1, color: Colors.black),
              ),
            ],
          ),



            SizedBox(height: 50,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterForm()));
              },child:
            Container(
                height: 56,
                width: 320,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.phone_android),
                    SizedBox(width: 10,),
                    Text("Daftar dengan No.HandPhone"),
                  ],
                )
            ),

            ),

            SizedBox(height: 270),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Container(
                    child: Text(
                      " Masuk",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),


          ],
        )
      ),
    );
  }
}