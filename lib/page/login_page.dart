import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      body: Center(
        child: Column(
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

              child: Column(
                children: [
                  SizedBox(height: 137,),

                  Center(
                    child: Text("MASUK", style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),),

                  )

                ],
              )
              
              
            ),

          ],
        ),
      ),
    );
  }
}