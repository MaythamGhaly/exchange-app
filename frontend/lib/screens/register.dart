import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/components/customTextForm.dart';

import 'components/customButton.dart';
import 'components/smallTextField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  hello() {
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
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
                'Register',
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: SmallTextForm.customText(
                      context,
                      'First Name',
                      'enter your first name',
                      _firstNameController,
                    ),
                  ),
                  Expanded(
                    child: SmallTextForm.customText(
                      context,
                      'Last Name',
                      'enter your last name',
                      _lastNameController,
                    ),
                  ),
                ],
              ),
              CustomTextForm.customText(context, 'Email', 'Enter your email',
                  _emailController, false, _passwordController, false),
              CustomTextForm.customText(
                  context,
                  'Password',
                  'Enter your password',
                  _passwordController,
                  true,
                  _passwordController,
                  true),
              CustomTextForm.customText(
                  context,
                  'Confirm Password',
                  'Enter your password',
                  _confirmPasswordController,
                  true,
                  _passwordController,
                  true),
              Container(
                margin:
                    const EdgeInsets.only(right: 30.0, left: 30.0, top: 10.0),
                child: const Text(
                  "By registring, you agree to our Terms of Service and Privacy Policy",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CustomButton(
                inputText: 'Register',
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('yes')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('no')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
