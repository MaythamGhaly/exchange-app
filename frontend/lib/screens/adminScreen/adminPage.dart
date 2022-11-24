import 'package:flutter/material.dart';
import 'package:frontend/screens/adminScreen/bannedSection.dart';
import 'package:frontend/screens/adminScreen/postsSection.dart';
import 'package:frontend/screens/adminScreen/usersSection.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/dark_theme_provider.dart';
import '../userScreen.dart/login.dart';


class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> with TickerProviderStateMixin {
  late TabController _controller;
  var users;

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", "");
  }

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
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
        leading: Image.asset(
          'assets/Exchange-logo.png',
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 111, 8, 143),
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
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("Switch theme is selected.");
                } else if (value == 1) {
                  logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false,
                  );
                }
              }),
        ],
        bottom: TabBar(
          indicatorColor: const Color.fromARGB(200, 92, 225, 230),
          splashBorderRadius: BorderRadius.circular(20),
          automaticIndicatorColorAdjustment: false,
          labelColor: const Color.fromARGB(200, 92, 225, 230),
          unselectedLabelColor: const Color.fromARGB(255, 111, 8, 143),
          controller: _controller,
          labelPadding: const EdgeInsets.only(left: 5, right: 5),
          tabs: const [
            Tab(
              icon: Icon(Icons.group),
              text: 'Users',
            ),
            Tab(
              icon: Icon(Icons.post_add),
              text: 'Posts',
            ),
            Tab(
              icon: Icon(Icons.block),
              text: 'Banned Users',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'Chats',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          userSection(),
          postsSections(),
          bannedSection(),
          SingleChildScrollView(child: CustomCard()),
        ],
      ),
    );
  }
}
