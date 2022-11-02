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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

              CustomTextForm.customText(context, 'Email', 'enter your email',
                  _email, false, _password, false),
              //   customText(context, "Email", "enter your email", _email, false),
              CustomTextForm.customText(context, "Password",
                  "enter your password", _password, false, _password, true),
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
                  style: TextStyle(color: Color.fromARGB(200, 92, 225, 230)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
