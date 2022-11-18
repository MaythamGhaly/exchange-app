import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/provider/dark_theme_provider.dart';
import 'package:frontend/components/customTextForm.dart';
import 'package:frontend/screens/register.dart';
import 'package:provider/provider.dart';
import '../services/rest_api.dart';
import '../components/customButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themesState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        actions: [
          Switch(
            activeColor: const Color.fromARGB(199, 1, 5, 5),
            activeTrackColor: const Color.fromARGB(255, 111, 8, 143),
            inactiveThumbColor: const Color.fromARGB(131, 65, 64, 64),
            inactiveTrackColor: const Color.fromARGB(255, 224, 224, 224),
            onChanged: (bool value) => {
              setState(() {
                themesState.setdarkTheme = value;
              })
            },
            value: themesState.getdarkThemes,
          ),
        ],
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
                  _emailController, false, _passwordController, false),
              CustomTextForm.customText(
                  context,
                  "Password",
                  "enter your password",
                  _passwordController,
                  false,
                  _passwordController,
                  true),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                ),
              ),
              CustomButton(
                  inputText: 'Login',
                  onpressed: () {
                    if (_formKey.currentState!.validate()) {
                      ApiService.signin(_emailController.text,
                          _passwordController.text, context);
                      _emailController.clear();
                      _passwordController.clear();
                    }
                  }),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
