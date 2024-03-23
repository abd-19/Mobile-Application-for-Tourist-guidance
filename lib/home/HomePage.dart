// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:app/home/HomeScreen.dart';
import 'package:app/home/ProfileScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.home_outlined, size: 30, color: Color(0xff008fa0)),
            icon: Icon(Icons.home, size: 25, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_2_outlined,
                size: 30, color: Color(0xff008fa0)),
            icon: Icon(Icons.person, size: 25, color: Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
