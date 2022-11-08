import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';

import 'chatingPage.dart';
import 'components/customButton.dart';
import 'components/uploadPost.dart';
import 'editProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late TabController _controller;
  List test = [
    "test",
    "test2",
    "Stest3",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4"
  ];

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: Image.asset(
            'assets/profile.jpg',
          ).image,
          radius: 80.0,
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
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
          ),
        ),
      ])),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: TabBar(
          indicatorColor: const Color.fromARGB(200, 92, 225, 230),
          splashBorderRadius: BorderRadius.circular(20),
          automaticIndicatorColorAdjustment: false,
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
              icon: Icon(Icons.favorite),
              text: 'Favorite',
            ),
          ],
        ),
      ),
      Container(
        height: 550,
        child: TabBarView(
          controller: _controller,
          children: <Widget>[
            UploadPost(),
            SizedBox(
              height: 500,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // number of items per row
                  crossAxisCount: 2,
                  // vertical spacing between the items
                  mainAxisSpacing: 10,
                  // horizontal spacing between the items
                  crossAxisSpacing: 10,
                ),
                children: test
                    .map((item) => Card(
                          elevation: 10,
                          shadowColor: const Color.fromARGB(255, 92, 225, 230),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                              onTap: () {
                                print("hi");
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/Exchange-logo.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                  const Text('Category - Name'),
                                  const Text('EXP: 2022-12-31'),
                                ],
                              )),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
