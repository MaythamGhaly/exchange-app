import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';

class CustomCard extends StatelessWidget {
  List test = [
    {"name": "test1", "lastChat": "hello"},
    {"name": "test2", "lastChat": "hey"},
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => const Login()));
      },
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              // child: SvgPicture.asset(
              //   chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
              //   color: Colors.white,
              //   height: 36,
              //   width: 36,
              // ),
              backgroundColor: Colors.blueGrey,
            ),
            title: const Text(
              "Maytham",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "hello",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: const Text("8:30"),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
