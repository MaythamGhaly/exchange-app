import 'package:flutter/material.dart';

class CustomTextForm {
  static Widget customText(
      BuildContext context,
      String labelText,
      String hintText,
      TextEditingController textEditingController,
      bool confirmPassword,
      TextEditingController password,
      bool ispassword) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(200, 92, 225, 230),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
          obscureText: ispassword,
          controller: textEditingController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(200, 92, 225, 230)),
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 224),
              labelText: labelText,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color.fromARGB(123, 0, 0, 0),
              ),
              labelStyle: TextStyle(
                color: Color.fromARGB(123, 0, 0, 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(200, 92, 225, 230)),
              )),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            if (confirmPassword) {
              if (value != password.text) {
                return 'Please enter same password';
              }
            }
            return null;
          }),
    );
  }
}
