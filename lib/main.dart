import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page/beranda.dart';
import 'page/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resikin',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPage(),
    );
  }
}