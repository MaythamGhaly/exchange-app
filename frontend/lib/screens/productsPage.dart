// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend/screens/categoryPage.dart';
import 'package:frontend/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/rest_api.dart';
import 'chatingPage.dart';
import '../components/customButton.dart';
import 'uploadPost.dart';
import 'editProfile.dart';
import 'home.dart';

class ProductPage extends StatefulWidget {
  var product;
  ProductPage({super.key, required this.product});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var product;

  List<dynamic> products = [];
  getProductByCategory() async {
    var data = await ApiService.getProductByCategory(product['category']);
    setState(() {
      products = data;
    });
  }

  // Future getUserId() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var userId = sharedPreferences.getString("user_id");
  //   setState(() {
  //     userId = userId;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
    getProductByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  child: Image.network(
                    'http://192.168.137.1:3000//uploads//${product['productPicture']}',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromARGB(255, 151, 71, 255),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ]),
              Container(
                  child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            product['product_name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'EXP:${product['expiry_date'].split('T')[0]}',
                            style: const TextStyle(
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
                child: Center(
                  child: Text(
                    product['description'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                    backgroundImage: Image.network(
                      'http://192.168.137.1:3000//uploads//${product['user']['profilePicture']}',
                    ).image,
                    radius: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${product['user']['first_name']} ${product['user']['last_name']}',
                      style: const TextStyle(
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
                child:
                    // product['user']['last_name'] == widget.userId ?
                    Center(
                  child: CustomButton(
                    inputText: "Start Exchange",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatingPage(userId: product['user']['_id'])),
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
                  CategoryPage(category: product['category'])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
