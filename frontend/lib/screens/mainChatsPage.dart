import 'package:flutter/material.dart';
import 'package:frontend/services/rest_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chatingPage.dart';

class CustomCard extends StatefulWidget {
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List userInformation = [];

  void getrooms() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var senderId = sharedPreferences.getString("user_id");
    var room = await ApiService.getRooms();
    for (var i = 0; i < room.length; i++) {
      if (room[i]['user1']['_id'] == senderId) {
        setState(() {
          userInformation.add(room[i]['user2']);
        });
      } else {
        setState(() {
          userInformation.add(room[i]['user1']);
        });
      }
    }
  }

  @override
  void initState() {
    getrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 40,
            child: userInformation.length > 0
                ? Container(
                    child: ListView(
                      children: userInformation
                          .map(
                            (info) => Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatingPage(userId: info['_id'])),
                                    );
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.blueGrey,
                                      backgroundImage: Image.network(
                                        'http://192.168.137.1:3000//uploads//${info['profilePicture']}',
                                      ).image,
                                    ),
                                    title: Text(
                                      '${info['first_name']} ${info['last_name']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 20, left: 20, top: 5, bottom: 5),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Center(
                    child: Text("No Chats"),
                  ),
          ),
        ),
      ],
    );
  }
}
