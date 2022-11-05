import 'package:flutter/material.dart';
import 'package:frontend/screens/components/customButton.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPost extends StatefulWidget {
  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  File? _image;
  String dropdownvalue = 'Item 1';

  final _formKey = GlobalKey<FormState>();
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final ImageTemporary = File(image.path);

    print(ImageTemporary);
    setState(() {
      this._image = ImageTemporary;
    });
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
              child: DropdownButton(
                isExpanded: true,
                style:
                    const TextStyle(color: Color.fromARGB(255, 92, 225, 230)),
                hint: const Text(
                  "Region",
                  style: TextStyle(color: Color.fromARGB(255, 92, 225, 230)),
                ),

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            )),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
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
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
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
          CustomButton(
              inputText: 'Upload Post',
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
              })
        ]),
      ),
    );
  }
}
