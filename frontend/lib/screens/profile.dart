import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';

import 'chatingPage.dart';
import 'components/customButton.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      SizedBox(
        height: 500,
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                'assets/profile.jpg',
                width: 140,
                height: 145,
              ),
            ),
          ),
          Center(
              child: Column(children: [
            const Text(
              'Maytham Ghaly',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                'Maythamghaly@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: CustomButton(
                inputText: 'Edit Profile',
                onpressed: () {},
              ),
            ),
          ])),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TabBar(
              indicatorColor: const Color.fromARGB(200, 92, 225, 230),
              splashBorderRadius: BorderRadius.circular(20),
              automaticIndicatorColorAdjustment: true,
              labelColor: const Color.fromARGB(200, 92, 225, 230),
              unselectedLabelColor: const Color.fromARGB(255, 111, 8, 143),
              controller: _controller,
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.file_upload,
                  ),
                  text: 'Upload Post',
                ),
                Tab(
                  icon: Icon(Icons.my_location),
                  text: 'Location',
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: TextField(
                      decoration:
                          InputDecoration(hintText: 'Search for address...'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title:
                        const Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: IconButton(
                        icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ]));
  }
}
