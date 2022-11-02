import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/components/customTextForm.dart';
import 'package:frontend/screens/basePage.dart';
import 'package:frontend/screens/register.dart';
import 'package:frontend/screens/basePage.dart';
import 'components/customButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
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
                        color: Color.fromARGB(101, 122, 118, 128),
                        offset: Offset(0, 10),
                      ),
                    ]),
              ),
              CustomTextForm.customText(context, 'Email', 'enter your email',
                  _email, false, _password, false),
              CustomTextForm.customText(context, "Password",
                  "enter your password", _password, false, _password, true),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color.fromARGB(162, 36, 36, 36)),
                ),
              ),
              CustomButton(
                inputText: 'Login',
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyStatefulWidget()),
                  );
                  // if (_formKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Processing Data')),
                  //   );
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Processing')),
                  //   );
                  // }
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
                  style: TextStyle(color: Color.fromARGB(162, 36, 36, 36)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
