import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Container(
                width: double.infinity,
                height: 200,
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
            Row(
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