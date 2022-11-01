import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;

  CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(200, 92, 225, 230),
            blurRadius: 15,
            offset: Offset(-2, 4),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(200, 92, 225, 230)),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 238, 238, 238),
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(200, 92, 225, 230),
            ),
            labelStyle: const TextStyle(
              color: Color.fromARGB(200, 92, 225, 230),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(200, 92, 225, 230)),
            )),
      ),
    );
  }
}
