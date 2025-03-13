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
          "Cleaning",
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

    body:
    SingleChildScrollView(child:
    Column(
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
              width: 100,
              height: 56,
            ),

            SizedBox(width: 5,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                border: Border.all(color: Colors.black, width: 1)
              ),
              width: 100,
              height: 56,
            ),

            SizedBox(width: 5,),


            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
                  border: Border.all(color: Colors.black, width: 1)

              ),
              width: 100,
              height: 56,
            )
          ],
        ),

        SizedBox(height: 10,),

        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
        child:
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
              border: Border.all(color: Colors.black, width: 1)

          ),
          width: 310,
          height: 100,
        )
          ,

        ),



        Text("Luas", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),),


        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
        child:
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1)
          ),

          height: 40,
          width: 340,
        )
          ,
        ),

        Text("Alamat", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),),

        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
          child:
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1)
            ),

            height: 60,
            width: 340,
          ),
        ),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Jumlah Pegawai"),
            SizedBox(width: 80,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1)
              ),
              height: 44,
              width: 120,
            )
          ],
        ),

        SizedBox(height: 20,),
        
        Text("Catatan"),

        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
          child:
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)

            ),
            width: 310,
            height: 100,
            child: Text("Catatan"),
          ),
        ),

        SizedBox( height: 20,),

        Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1)
              ),
              height: 50,
              width: 140,
            ),

            SizedBox(width: 20,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal,
                  border: Border.all(color: Colors.black, width: 1)
              ),
              height: 50,
              width: 140,
            )
          ],
        ),),

SizedBox(height: 40,)




          ],
    ), )
    );
  }
}