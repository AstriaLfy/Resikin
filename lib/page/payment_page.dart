import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
                  "Pembayaran",
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
        child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * 0.07,
    ),
    child:

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),

        Text("Mohon Tranfer ke Resikin", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),

        Row(
          children: [
            Text("Transfer sebelum :", style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
            SizedBox(width: 110,),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),

        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10,),
            Text("BANK BCA"),
          ],
        ),
        SizedBox(height: 15,),
        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Nomor VA")),
        ),

        SizedBox(height: 10,),

        Text("Jumlah Transfer", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Rp. xxx xxx")),
        ),
        SizedBox(height: 10,),


        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Guide")),
        ),
        SizedBox(height: 20,),


        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Guide")),
        ),

        SizedBox(height: 20,),


        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Guide")),
        ),

        SizedBox(height: 25,),

        Center(
          child:  Text("Batalkan Transaksi", style: GoogleFonts.poppins(color: Colors.red, fontSize: 12),),
        ),
        SizedBox(height: 25,),

        Container(
          height: 50,
          width: 310,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(child: Text("Saya Sudah Transfer")),
        ),
      ],
    )


    ,)


      ),
    );
  }
}
