import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';

class Cleanup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Tinggi AppBar
        child: ReusableContainer(
          child:
          Center(
        child: Column(
        children: [
        SizedBox(height: 112),
        Text(
          "MASUK",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        ],
      ),
    )
          ,
        ),),

    body: Column(
      children: [
        SizedBox(height: 30,),

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                  border: Border.all(color: Colors.black, width: 1)
              ),
              width: 120,
              height: 56,
            ),

            SizedBox(width: 5,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                border: Border.all(color: Colors.black, width: 1)
              ),
              width: 120,
              height: 56,
            ),

            SizedBox(width: 5,),


            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                  border: Border.all(color: Colors.black, width: 1)

              ),
              width: 120,
              height: 56,
            )
          ],
        ),

        SizedBox(height: 10,),

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
              border: Border.all(color: Colors.black, width: 1)

          ),
          width: 372,
          height: 100,
        )


      ],
    )
    );
  }
}