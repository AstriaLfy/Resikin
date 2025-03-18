import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ReusableContainer(child: Center(
                child:
                Column(
                  children: [
                    SizedBox(height: 125,),
                    Text("HISTORY", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600,
                    ),),
                  ],
                )

            )
            ),            Row(
              children: [
                Text("Lupa Kata Sandi", style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600
                ),)
              ],
            )
          ],
        )

    );
  }
}