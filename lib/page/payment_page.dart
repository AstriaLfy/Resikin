import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Halaman Pembayaran")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Mohon Tranfer ke Resikin"),

            Row(
              children: [
                Text("Transfer sebelum :"),

                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text("BANK BCA"),
              ],
            ),

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

            SizedBox(height: 30,),
            
            Text("Jumlah Transfer"),

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
            SizedBox(height: 30,),


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
            SizedBox(height: 30,),


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

            SizedBox(height: 30,),


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

            SizedBox(height: 100,),


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
        ),
      ),
    );
  }
}
