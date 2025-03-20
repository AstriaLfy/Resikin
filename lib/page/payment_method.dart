import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';
import 'payment_page.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String?
  _selectedPaymentMethod;
  bool _agreeToUseCoins = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "Payment Method",
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
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                height: 66,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Color(0xFFC2DAD5),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.person, size: 40,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text("Cleaning"),
                        SizedBox(height: 5,),
                        Text("Rp. 100.000")
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),


                  Container(
                    width: 350,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('Resik.in Koin'),
                          value: 'Resik.in Koin',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Bank BCA'),
                          value: 'Bank BCA',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Bank Mandiri'),
                          value: 'Bank Mandiri',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Gopay'),
                          value: 'Gopay',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Spay'),
                          value: 'Spay',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),

            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Color(0xFFC2DAD5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Pakai xxx koin",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                    Switch(
                      value: _agreeToUseCoins,
                      onChanged: (bool value) {
                        setState(() {
                          _agreeToUseCoins = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                SizedBox(width: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Harga",style: GoogleFonts.poppins(fontSize: 14,)),
                    Text("Rp. Xxx xxx xxx", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),),
                  ],
                )

              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07,
                ),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.teal,
                  ),
                  child: Center(child: Text("BAYAR", style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
