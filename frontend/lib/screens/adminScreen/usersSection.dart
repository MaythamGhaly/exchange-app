import 'package:flutter/material.dart';
import 'package:frontend/screens/productsPage.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../services/rest_api.dart';

class userSection extends StatefulWidget {
  userSection({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _userSectionState createState() => _userSectionState();
}

class _userSectionState extends State<userSection> {
  List<dynamic> usersList = [];

  getusers() async {
    var data = await ApiService.getusers();
    setState(() {
      usersList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            height: 500,
            child: usersList.length > 0
                ? ListView(
                    children: usersList
                        .map(
                          (user) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: Image.network(
                                    'http://192.168.137.1:3000//uploads//${user['profilePicture']}',
                                  ).image,
                                  backgroundColor: Colors.blueGrey,
                                ),
                                title: Text(
                                  '${user['first_name']} ${user['last_name']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.block),
                                  onPressed: () async {
                                    var ban = await ApiService.banUser(
                                        context, user['_id']);
                                    getusers();
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  )
                : Center(
                    child: const Text('No users found'),
                  ))
      ],
    );
  }
}
