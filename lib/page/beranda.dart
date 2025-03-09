import 'package:flutter/material.dart';
import 'reusable.dart';

void main() {
  runApp(MaterialApp(home: Beranda()));
}

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ReusableContainer(),

          // Menggunakan Align untuk menempatkan Container di tengah
          Align(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF3D8D7A),
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
          ),
        ],
      ),
    );
  }
}