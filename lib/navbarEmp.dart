import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'page/history_page.dart';
import 'page/station_page.dart';
import 'page/beranda.dart';
import 'page/profile_page.dart';
import 'page/Emp/beranda_emp.dart';
import 'page/Emp/order_page.dart';
import 'page/Emp/history_emp.dart';
import 'page/Emp/profil_emp.dart';



void main() {
  runApp(MaterialApp(home: Navbaremp()));
}

class Navbaremp extends StatefulWidget {
  const Navbaremp({super.key});

  @override
  _Navbaremp createState() => _Navbaremp();
}

class _Navbaremp extends State<Navbaremp> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    BerandaEmp(),
    OrderPage(),
    HistoryEmp(),
    ProfilEmp(),
  ];

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 10),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: NavigationBar(
            height: 75,
            elevation: 10,
            backgroundColor: Colors.transparent,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              NavigationDestination(
                  icon: Icon(Iconsax.clipboard),
                  label: 'List'
              ),
              NavigationDestination(
                icon: Icon(Iconsax.music_playlist_copy),
                label: 'Pesanan',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.timer),
                label: 'Riwayat',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.personalcard),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
