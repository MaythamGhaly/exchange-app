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
            blurRadius: 3,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
          obscureText: ispassword,
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            labelText: labelText,
            hintText: hintText,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'this field is required';
            }
            if (confirmPassword) {
              if (value != password.text) {
                return 'this field is required';
              }
            }
            return null;
          }),
    );
  }
}
