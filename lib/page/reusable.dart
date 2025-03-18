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
        color: color,
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(175, 45)),
      ),
      child: child, // Menampilkan child yang diberikan
    );
  }
}

class ReuseField extends StatelessWidget {
  final Widget? child; // Menggunakan Widget? untuk memungkinkan child null
  final double height;
  final double width;
  final Color color;

  const ReuseField({
    Key? key,
    this.child,
    this.height = 56, // Default height
    this.width = 320, // Default width
    this.color = const Color(0xffd9d9d9), // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20), // Sudut melengkung
      ),
      child: child, // Menampilkan child yang diberikan
    );
  }
}
