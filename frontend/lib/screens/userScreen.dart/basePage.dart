import 'package:flutter/material.dart';
import 'package:frontend/screens/userScreen.dart/home.dart';
import 'package:frontend/screens/userScreen.dart/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/dark_theme_provider.dart';
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
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", "");
  }

  @override
  Widget build(BuildContext context) {
    final themesState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    child: Text("Contact Us"),
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
                } else if (value == 2) {
                  logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false,
                  );
                }
              }),
        ],
        leading: Image.asset(
          'assets/Exchange-logo.png',
        ),
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
