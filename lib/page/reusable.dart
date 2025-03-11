import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Widget? child; // Menggunakan Widget? untuk memungkinkan child null
  final double height;
  final Color color;

  const ReusableContainer({
    Key? key,
    this.child,
    this.height = 175, // Default height
    this.color = const Color(0xFF3D8D7A), // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        color: color,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(175, 45),
        ),
      ),
      child: child, // Menampilkan child yang diberikan
    );
  }
}