import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resikin/page/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resikin/features/firestore_database/database_service.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final _dbService = DatabaseService();
  String?
  _selectedPaymentMethod; // Variable to hold the selected payment method
  bool _agreeToUseCoins = false; // Variable to hold agreement status

  void _processPayment() {
    // Create a payment data map to send to Firestore
    Map<String, dynamic> paymentData = {
      'payment_method': _selectedPaymentMethod,
      'use_coins': _agreeToUseCoins,
      'total_price': "Rp. Xxx xxx xxx", // Replace with actual total price
      'timestamp': FieldValue.serverTimestamp(), // Add a timestamp
    };

    // Call the createPayment method from DatabaseService
    _dbService
        .createPayment(paymentData)
        .then((_) {
          // Handle successful payment processing (e.g., show a success message)
          print("Payment processed successfully");
          // Optionally navigate to another screen or show a confirmation dialog
        })
        .catchError((error) {
          // Handle any errors that occur during the payment processing
          print("Error processing payment: $error");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Height of AppBar
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
                  color: Colors.grey,
                ),
                child: Center(
                  child: Text(
                    "Metode Pembayaran",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Resikin Koin'),
                    value: 'Resikin Koin',
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
                  color: Colors.grey,
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
            Text("Total Harga"),
            Text("Rp. Xxx xxx xxx"), // Replace with actual total price
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: GestureDetector(
                onTap: _processPayment, // Call the payment processing method
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(child: Text("BAYAR")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
