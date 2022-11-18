import 'package:flutter/material.dart';
import 'package:frontend/screens/favoritesSection.dart';
import 'package:frontend/screens/login.dart';

import '../services/rest_api.dart';
import 'chatingPage.dart';
import '../components/customButton.dart';
import 'uploadPost.dart';
import 'editProfile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

  var user;

  getUser() async {
    var data = await ApiService.getUserr();
    setState(() {
      user = data;
    });
  }

  @override
  void initState() {
    getUser();
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: user == null
            ? const Center(child: CircularProgressIndicator())
            : Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: Image.network(
                      'http://192.168.137.1:3000//uploads//${user['profilePicture']}',
                    ).image,
                    radius: 80.0,
                  ),
                ),
                Center(
                    child: Column(children: [
                  Text(
                    '${user['first_name']} ${user['last_name']}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      user['email'],
                      style: const TextStyle(
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
                          MaterialPageRoute(
                              builder: (context) => EditProfile(user: user)),
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
                    unselectedLabelColor:
                        const Color.fromARGB(255, 111, 8, 143),
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
                      Favorites(),
                    ],
                  ),
                ),
              ]));
  }
}
