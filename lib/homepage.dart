import 'package:flutter/material.dart';
import 'package:keydata_zipcikti/screens/kilit_acma.dart';
import 'package:keydata_zipcikti/screens/qr_genarator.dart';
import 'package:keydata_zipcikti/screens/scripts_screen.dart';
import 'package:keydata_zipcikti/screens/zipcikti.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _pages = [
    const OrtakAlan(),
    const Lock(),
    const ScriptScreen(),
    // const Center(
    //     child: Text(
    //   'QR Oluşturma',
    //   style: TextStyle(fontSize: 60),
    // )),
    const QRGenerator(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Image.asset(
            "assets/img/100logo.png",
            width: 275,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: UIColorHelper.colorData,
        selectedItemColor: UIColorHelper.colorKey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_shared_outlined),
            label: 'Ortak Alan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open_outlined),
            label: 'Kilit Kaldırma',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code_sharp),
            label: 'Scriptler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: 'QR Oluşturma',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
