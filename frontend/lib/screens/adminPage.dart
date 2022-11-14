import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/screens/profile.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../components/customButton.dart';
import 'login.dart';
import 'mainChatsPage.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key});

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
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
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    // child: SvgPicture.asset(
                    //   chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                    //   color: Colors.white,
                    //   height: 36,
                    //   width: 36,
                    // ),
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text(
                    "Maytham",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.block),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 80),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    // child: SvgPicture.asset(
                    //   chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                    //   color: Colors.white,
                    //   height: 36,
                    //   width: 36,
                    // ),
                    backgroundColor: Colors.blueGrey,
                  ),
                  title: Text(
                    "Maytham",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.remove_circle),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 80),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
