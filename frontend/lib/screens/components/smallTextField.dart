import 'package:flutter/material.dart';

class SmallTextForm {
  static Widget customText(BuildContext context, String labelText,
      String hintText, TextEditingController textEditingController) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 20, top: 20),
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
          controller: textEditingController,
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
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          }),
    );
  }
}