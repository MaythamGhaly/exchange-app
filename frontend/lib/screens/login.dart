import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 111, 8, 143),
        elevation: 20,
        title: const Text(
          'ExpChange',
          style: TextStyle(
            color: Color.fromARGB(200, 92, 225, 230),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 250.0,
              child: Center(
                child: DropShadowImage(
                  offset: const Offset(5, 5),
                  scale: 1,
                  blurRadius: 20,
                  image: Image.asset(
                    'assets/Exchange-logo.png',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                    color: Color.fromARGB(200, 92, 225, 230),
                    blurRadius: 15,
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(200, 92, 225, 230)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
