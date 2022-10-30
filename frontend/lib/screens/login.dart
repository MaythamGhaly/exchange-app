import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 111, 8, 143),
        elevation: 10,
        title: const Text(
          'ExpChange',
          style: TextStyle(
            color: Color.fromARGB(255, 47, 211, 233),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
