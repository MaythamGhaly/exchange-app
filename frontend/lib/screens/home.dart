import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/components/CustomCategoryButton.dart';
import 'package:frontend/screens/models/product.dart';
import 'package:frontend/screens/productsPage.dart';
import 'package:http/http.dart' as http;

import '../services/rest_api.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final _formKey = GlobalKey<FormState>();
  List<Product> products = [];
  getProduct() async {
    var data = await ApiService.getProduct();

    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            CustomCategory(
                text: 'Food', onpressed: () {}, icon: Icons.food_bank_outlined),
            CustomCategory(
                text: 'Beverage',
                onpressed: () {},
                icon: Icons.emoji_food_beverage),
            CustomCategory(
                text: 'Medicine',
                onpressed: () {},
                icon: Icons.medication_outlined),
            CustomCategory(
                text: 'Beauty', onpressed: () {}, icon: Icons.auto_fix_high),
            CustomCategory(
                text: 'Donate', onpressed: () {}, icon: Icons.bloodtype),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 18),
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(15),
                              width: 18,
                              child: const Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 151, 71, 255),
                                size: 30,
                              ),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Center(
              child: SizedBox(
                  height: 150.0,
                  width: 300.0,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 400.0,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800)),
                    items: [
                      Image.asset('assets/1.jpg'),
                      Image.asset('assets/2.jpg'),
                      Image.asset('assets/3.jpg'),
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: i);
                        },
                      );
                    }).toList(),
                  )),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 500,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // number of items per row
                    crossAxisCount: 2,
                    // vertical spacing between the items
                    mainAxisSpacing: 10,
                    // horizontal spacing between the items
                    crossAxisSpacing: 10,
                  ),
                  children: products
                      .map((product) => Card(
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
                                        builder: (context) => ProductPage()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Image.network(
                                      'http://192.168.0.101:3000//uploads//${product.productPicture}',
                                      width: 120,
                                      height: 120,
                                    ),
                                    Text(
                                        '${product.product_name}-${product.category}'),
                                    Text(
                                        'EXP:${product.expiry_date.split('T')[0]}'),
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
    );
  }
}
