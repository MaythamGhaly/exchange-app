import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  final String text;
  final Function onpressed;
  final IconData icon;

  const CustomCategory(
      {Key? key,
      required this.text,
      required this.onpressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: () {
              onpressed();
            },
            // ignore: sort_child_properties_last
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 151, 71, 255),
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              elevation: 6,
              shadowColor: const Color.fromARGB(255, 92, 225, 230),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
