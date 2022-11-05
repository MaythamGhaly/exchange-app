import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/components/customTextForm.dart';

import 'components/customButton.dart';
import 'components/smallTextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          'Edit Profile',
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
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    'assets/profile.jpg',
                    width: 140,
                    height: 145,
                  ),
                ),
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
              CustomButton(
                inputText: 'Save',
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
