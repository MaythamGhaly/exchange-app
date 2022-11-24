import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/components/customButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../services/rest_api.dart';

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _image;
  String dropdownvalue = 'Item 1';

  final _formKey = GlobalKey<FormState>();
  var items = [
    'Food',
    'Medicine',
    'Others',
    'Donate',
  ];
  String? selectedValue;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final ImageTemporary = File(image.path);

    setState(() {
      _image = ImageTemporary;
    });
  }

  Future upload() async {
    if (_image == null) return;

    String base64 = base64Encode(_image!.readAsBytesSync());
    String imageName = _image!.path.split("/").last;
    print(imageName);
  }

  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.topLeft,
        child: Column(children: [
          Row(children: [
            Expanded(
              child: SizedBox(
                  width: 100,
                  height: 160,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              const BorderSide(color: Colors.black, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('assets/1.jpg')),
                          IconButton(
                              onPressed: getImage,
                              icon: const Icon(Icons.add_a_photo)),
                        ],
                      ))),
            ),
            Expanded(
                child: SizedBox(
              width: 80,
              child: DropdownButton2(
                hint: const Text('Select Category',
                    style: TextStyle(
                      color: Color.fromARGB(255, 92, 225, 230),
                    )),
                isExpanded: true,
                style:
                    const TextStyle(color: Color.fromARGB(255, 92, 225, 230)),

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: Color.fromARGB(255, 92, 225, 230)),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
              ),
            )),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Product Name',
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
                controller: _expiryDateController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Expiry Date',
                  labelText: 'Expiry Date',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
                controller: _descriptionController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
                  filled: true,
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this field is required';
                  }
                  return null;
                }),
          ),
          CustomButton(
              inputText: 'Upload Post',
              onpressed: () {
                if (_formKey.currentState!.validate() && _image != null) {
                  var data = jsonEncode({
                    "product_name": _productNameController.text,
                    "expiry_date": _expiryDateController.text,
                    "category": selectedValue,
                    "description": _descriptionController.text,
                    "productPicture": '',
                  });
                  ApiService.uploadPost(data, _image, context);
                  _descriptionController.clear();
                  _productNameController.clear();
                  _expiryDateController.clear();
                  _image = null;
                  return;
                }
                if (_image == null) {
                  ApiService.showSnackBar(context, "image is required");
                }
              })
        ]),
      ),
    );
  }
}
