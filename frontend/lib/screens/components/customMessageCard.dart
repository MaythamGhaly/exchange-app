import 'package:flutter/material.dart';

class messageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 3,
            shadowColor: const Color.fromARGB(255, 92, 225, 230),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 50.0, bottom: 10.0),
                  child: Text("Hello",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
