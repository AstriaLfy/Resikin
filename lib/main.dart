import 'package:flutter/material.dart';
import 'page/beranda.dart';

void main() {
  runApp(MaterialApp(home: Halaman1()));
}

class Halaman1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 420,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(125.0),
                bottomRight: Radius.circular(125.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Mengatur kolom ke kiri
                children: [
                  Row(
                    children: [
                      Text(
                        "Halo, Raffi",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                      SizedBox(width: 140),
                      Icon(Icons.person), //ganti menjadi iconButton
                      SizedBox(width: 20),
                      Icon(Icons.notifications),
                    ],
                  ),

                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      width: 320,
                      height: 30,
                      child: Center(
                        child: Text(
                          "   Wiih, kamu udah hasilin 35.000 Koin!",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
