import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/homeController.dart';

import 'components/customButton.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var screens = [
    HomeController(),
    const Form(child: Text('HELLO NANAAAA')),
    const Form(child: Text('HELLO SAMMMM')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 111, 8, 143),
        elevation: 20,
        title: const Text(
          'ExpChange',
          style: TextStyle(
            color: Color.fromARGB(200, 92, 225, 230),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              icon: const Icon(
                Icons.book,
                color: Color.fromARGB(200, 92, 225, 230),
              ),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("My Account"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Settings"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  print("Logout menu is selected.");
                }
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(200, 92, 225, 230),
        unselectedItemColor: Color.fromARGB(255, 111, 8, 143),
        onTap: _onItemTapped,
      ),
    );
  }
}
