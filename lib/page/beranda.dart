import 'package:flutter/material.dart';
import 'package:resikin/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:resikin/page/login_page.dart';

class Beranda extends StatelessWidget {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  void _logout(BuildContext context) async {
    await _authServices.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Selamat datang di Beranda!"),
          ElevatedButton(onPressed: () => _logout(context), child: Text("Logout"))
        ],
      ),
    );
  }
}
