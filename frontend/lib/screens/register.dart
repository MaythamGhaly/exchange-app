import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import 'components/customButton.dart';
import 'components/customTextField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  hello() {
    print('hello');
  }

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
              height: 150.0,
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
            const Text(
              'Register',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(200, 92, 225, 230),
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Color.fromARGB(200, 122, 118, 128),
                      offset: Offset(0, 4.0),
                    ),
                  ]),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 10, top: 20),
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
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(200, 92, 225, 230)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 238, 238, 238),
                                labelText: 'First Name',
                                hintText: ('Enter your first name'),
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(200, 92, 225, 230),
                                ),
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(200, 92, 225, 230),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(200, 92, 225, 230)),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 20, top: 20),
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
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(200, 92, 225, 230)),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 238, 238, 238),
                                labelText: 'Last Name',
                                hintText: ('Enter your last name'),
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(200, 92, 225, 230),
                                ),
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(200, 92, 225, 230),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(200, 92, 225, 230)),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomTextField(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            const CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
            ),
            const CustomTextField(
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
              isPassword: true,
            ),
            CustomButton(
              inputText: 'Register',
              callbackFunction: hello,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Color.fromARGB(200, 92, 225, 230)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
