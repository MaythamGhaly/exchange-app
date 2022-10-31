import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;

  const CustomButton({required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {},
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
