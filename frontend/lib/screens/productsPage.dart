import 'package:flutter/material.dart';
import 'package:frontend/screens/login.dart';

import 'chatingPage.dart';
import 'components/customButton.dart';
import 'components/uploadPost.dart';
import 'editProfile.dart';
import 'home.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List test = [
    "test",
    "test2",
    "Stest3",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4",
    "test4"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/Exchange-logo.png',
                      ),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.topLeft,
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 151, 71, 255),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Container(
                  child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            '1/1/2023',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.favorite),
                            color: const Color.fromARGB(255, 151, 71, 255),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Container(
                margin: const EdgeInsets.only(
                    top: 25, right: 10, left: 10, bottom: 25),
                child: const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'I’d like to exchange this panadol medicine box with micerol or vitamin D-C or zinc tablets',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: Image.asset(
                      'assets/profile.jpg',
                    ).image,
                    radius: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Maytham Ghaly',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 25,
                ),
                child: Center(
                  child: CustomButton(
                    inputText: "Start Exchange",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatingPage()),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: const Center(
                      child: Text(
                        'Similar Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        // number of items per row
                        crossAxisCount: 2,
                        // vertical spacing between the items
                        mainAxisSpacing: 10,
                        // horizontal spacing between the items
                        crossAxisSpacing: 10,
                      ),
                      children: test
                          .map((item) => Card(
                                elevation: 10,
                                shadowColor:
                                    const Color.fromARGB(255, 92, 225, 230),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductPage()),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/Exchange-logo.png',
                                          width: 120,
                                          height: 120,
                                        ),
                                        const Text('Category - Name'),
                                        const Text('EXP: 2022-12-31'),
                                      ],
                                    )),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
