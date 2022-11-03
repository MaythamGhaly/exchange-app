import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/homeController.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'components/customButton.dart';
import 'login.dart';
import 'mainChatsPage.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var screens = [
    HomeController(),
    CustomCard(),
    const Form(child: Text('HELLO SAMMMM')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themesState = Provider.of<DarkThemeProvider>(context);
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
          color: const Color.fromARGB(255, 111, 8, 143),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              icon: const Icon(
                Icons.menu,
                color: const Color.fromARGB(255, 111, 8, 143),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        const Text('theme'),
                        Switch(
                          activeColor: const Color.fromARGB(200, 92, 225, 230),
                          activeTrackColor:
                              const Color.fromARGB(255, 111, 8, 143),
                          inactiveThumbColor:
                              const Color.fromARGB(131, 65, 64, 64),
                          inactiveTrackColor:
                              const Color.fromARGB(255, 224, 224, 224),
                          onChanged: (bool value) => {
                            setState(() {
                              themesState.setdarkTheme = value;
                            })
                          },
                          value: themesState.getdarkThemes,
                        ),
                      ],
                    ),
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
                  print("Switch theme is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                } else if (value == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
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
        unselectedItemColor: const Color.fromARGB(255, 111, 8, 143),
        onTap: _onItemTapped,
      ),
    );
  }
}
