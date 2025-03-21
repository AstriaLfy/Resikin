import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable.dart';

class BerandaEmp extends StatelessWidget {
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
                  "Resikin",
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
            borderRadius: BorderRadius.circular(20),
          ),
          width: 375,
          height: 500,
          child:

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),child:
          SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cleaning", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),),

                Container(
                  width: 270, // Adjust the width as needed
                  child: Divider(thickness: 1, color: Colors.black),
                ),

              ],
            )
            ,
          ),

          )


        )


      ],
    ),


    )



    );
  }
}
