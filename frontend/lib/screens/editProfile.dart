import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:frontend/components/customTextForm.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../components/customButton.dart';
import '../components/smallTextField.dart';
import '../services/rest_api.dart';

class EditProfile extends StatefulWidget {
  var user;

  EditProfile({super.key, required this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _previousPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  var user;
  final _formKey = GlobalKey<FormState>();
  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    final ImageTemporary = File(pickedFile.path);

    print(ImageTemporary);
    setState(() {
      this._image = ImageTemporary;
    });
  }

  @override
  void initState() {
    user = widget.user;
    _firstNameController.text = user['first_name'];
    _lastNameController.text = user['last_name'];
    super.initState();
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
          leading: const BackButton(
            color: Color.fromARGB(255, 111, 8, 143),
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          child: user == null
              ? Center(child: CircularProgressIndicator())
              : Form(
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
                                      backgroundImage: Image.network(
                                        'http://192.168.137.1:3000//uploads//${user['profilePicture']}',
                                      ).image,
                                      radius: 80.0,
                                    )),
                          IconButton(
                              onPressed: getImage,
                              icon: const Icon(Icons.add_a_photo)),
                        ]),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SmallTextForm.customText(
                              context,
                              'first name',
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
                      CustomTextForm.customText(
                          context,
                          'Previous password',
                          'Enter your previous password',
                          _previousPasswordController,
                          false,
                          _passwordController,
                          true),
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
                        onpressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var data = jsonEncode({
                              "firstName": _firstNameController.text,
                              "lastName": _lastNameController.text,
                              "previousPass": _previousPasswordController.text,
                              "password": _passwordController.text,
                              "confirm_pass": _confirmPasswordController.text,
                              "profilePicture": user['profilePicture'],
                            });
                            ApiService.editProfile(data, _image, context);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
