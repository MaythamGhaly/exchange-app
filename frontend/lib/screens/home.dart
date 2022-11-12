import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/components/CustomCategoryButton.dart';
import 'package:frontend/screens/productsPage.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../services/rest_api.dart';
import 'categoryPage.dart';

class HomeController extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController>
    with TickerProviderStateMixin {
  late TabController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
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
            margin: const EdgeInsets.only(top: 20),
            child: TabBar(
              indicatorColor: const Color.fromARGB(200, 92, 225, 230),
              splashBorderRadius: BorderRadius.circular(20),
              automaticIndicatorColorAdjustment: false,
              labelColor: const Color.fromARGB(200, 92, 225, 230),
              unselectedLabelColor: const Color.fromARGB(255, 111, 8, 143),
              controller: _controller,
              labelPadding: const EdgeInsets.only(left: 5, right: 5),
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.all_inbox_sharp,
                  ),
                  text: 'All',
                ),
                Tab(
                  icon: Icon(Icons.food_bank_outlined),
                  text: 'Food',
                ),
                Tab(
                  icon: Icon(Icons.medication),
                  text: 'Medicine',
                ),
                Tab(
                  icon: Icon(Icons.auto_fix_high),
                  text: 'Beauty',
                ),
                Tab(
                  icon: Icon(Icons.bloodtype),
                  text: 'Donate',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 450,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                CategoryPage(category: 'all'),
                CategoryPage(category: 'food'),
                CategoryPage(category: 'medicine'),
                CategoryPage(category: 'beauty'),
                CategoryPage(category: 'donate'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
