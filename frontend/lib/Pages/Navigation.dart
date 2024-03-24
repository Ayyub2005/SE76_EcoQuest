import 'package:flutter/material.dart';
import 'package:frontend/Pages/avatar_cust.dart';
import 'package:frontend/Pages/character_customization.dart';
import 'package:frontend/Pages/homepage.dart';
import 'package:frontend/Pages/model.dart';
import 'package:frontend/Pages/rotate_card.dart';
import 'package:frontend/Pages/settings.dart';
import 'package:frontend/Pages/user_info.dart';

import '../AR/ar_mystery_box_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
          selectedItemColor: const Color.fromRGBO(0, 162, 142, 1).withOpacity(0.7),
          unselectedItemColor: Colors.white,
        ),
      ),
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    CharacterCards(),
    UserInfoPage(),
    InstructionsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Explicitly set the type to fixed
        backgroundColor: Colors.black, // This will now work as expected
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_rounded,color: Colors.white),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_sharp, color: Colors.white),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ArMysteryBoxScreen()),
        );
      // Your action here
      print('FloatingActionButton pressed');
    },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 4.0), // Black border
          ),
          child: const ClipOval(
            child: Material(
              color: Colors.white,
              child: Icon(
                Icons.camera_alt_outlined,
                size: 36,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
