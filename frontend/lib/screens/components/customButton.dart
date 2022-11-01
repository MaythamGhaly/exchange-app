import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final Function onpressed;

  const CustomButton(
      {Key? key, required this.inputText, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 50,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: const Color.fromARGB(200, 92, 225, 230),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(200, 92, 225, 230),
            offset: Offset(
              0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          onpressed();
        },
        child: Text(
          inputText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
