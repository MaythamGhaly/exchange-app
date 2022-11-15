import 'package:flutter/material.dart';

class messageCard extends StatelessWidget {
  final String message;

  const messageCard({Key? key, required this.message}) : super(key: key);
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 50.0, bottom: 10.0),
                  child: Text(message,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
