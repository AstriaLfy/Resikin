import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reusable.dart';

class Acountsetting extends StatefulWidget {
  @override
  _Acountsetting createState() => _Acountsetting();
}

class _Acountsetting extends State<Acountsetting> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0), // Height of AppBar
        child: ReusableContainer(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 112),
                Text(
                  "Pengaturan Akun",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pasang foto menarik! Semua orang bakal bisa lihat',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Masukkan email yang valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'No Handphone',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      phone = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'No Handphone tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle submit
                        print('Form Submitted: $name, $email, $phone, $password');
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle account deletion
                      print('Akun dihapus');
                    },
                    child: Text('Hapus Akun'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}