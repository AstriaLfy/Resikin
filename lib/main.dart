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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
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

                  SizedBox(height: 25),
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

          new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            height: 96,
            width: 340,
          ),

          SizedBox(height: 30),

          new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            height: 96,
            width: 340,
          ),

          SizedBox(height: 30),

          Row(
            children: [
              SizedBox(width: 35),
              new Container(
                height: 122,
                width: 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),
              new Container(
                height: 122,
                width: 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
