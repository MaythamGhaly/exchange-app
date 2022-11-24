import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/screens/userScreen.dart/Search.dart';
import 'categoryPage.dart';

class HomeController extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController>
    with TickerProviderStateMixin {
  TextEditingController _searchController = TextEditingController();
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
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a product name';
                      }
                    },
                    controller: _searchController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      color: const Color.fromARGB(255, 111, 8, 143),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => search(
                                        product_name: _searchController.text,
                                      )));
                        }
                      },
                    ))
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
              unselectedLabelColor: Color.fromARGB(255, 153, 14, 196),
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
                  icon: Icon(Icons.other_houses),
                  text: 'Others',
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
                CategoryPage(category: 'All'),
                CategoryPage(category: 'Food'),
                CategoryPage(category: 'Medicine'),
                CategoryPage(category: 'Others'),
                CategoryPage(category: 'Donate'),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
