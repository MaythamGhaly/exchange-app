import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/register.dart';
import 'components/customButton.dart';
import 'components/customTextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  hello(x) {
    print(x);
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
            const CustomTextField(
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            const CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
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
