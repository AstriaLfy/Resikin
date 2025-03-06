import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding untuk konten
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Halaman Registrasi',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}