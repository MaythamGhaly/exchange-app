import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/homePage.dart';
import 'package:frontend/screens/register.dart';
import 'components/customButton.dart';
import 'components/customTextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

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
              'Login',
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
            Container(
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
                controller: _email,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(200, 92, 225, 230)),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 238, 238, 238),
                    labelText: "Email",
                    hintText: "enter your email",
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
            ),
            Container(
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
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(200, 92, 225, 230)),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 238, 238, 238),
                    labelText: "Password",
                    hintText: "Enter your password",
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
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Color.fromARGB(200, 92, 225, 230)),
              ),
            ),
            CustomButton(
              inputText: 'Login',
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
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
