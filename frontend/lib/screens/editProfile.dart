import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/screens/components/customTextForm.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final ImageTemporary = File(image.path);

    print(ImageTemporary);
    setState(() {
      this._image = ImageTemporary;
    });
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
                child: Column(children: [
                  Center(
                      child: _image != null
                          ? CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: Image.file(
                                _image!,
                              ).image,
                              radius: 80.0,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: Image.asset(
                                'assets/profile.jpg',
                              ).image,
                              radius: 80.0,
                            )),
                  // ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: _image != null
                  //         ? Image.file(
                  //             _image!,
                  //             height: 200,
                  //             width: 200,
                  //           )
                  //         : Image.asset(
                  //             'assets/profile.jpg',
                  //             height: 200,
                  //             width: 200,
                  //           )
                  // Image.asset(
                  //   'assets/profile.jpg',
                  //   width: 140,
                  //   height: 145,
                  // ),
                  // ),
                  IconButton(
                      onPressed: getImage, icon: const Icon(Icons.add_a_photo)),
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
