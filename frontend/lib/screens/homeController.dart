import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeController extends StatefulWidget {
  HomeController({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.food_bank_outlined,
                      color: Color.fromARGB(255, 151, 71, 255),
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 92, 225, 230),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    'Food',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.emoji_food_beverage,
                      color: Color.fromARGB(255, 151, 71, 255),
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 92, 225, 230),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    'Beverage',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.medication_outlined,
                      color: Color.fromARGB(255, 151, 71, 255),
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 92, 225, 230),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    'Medicine',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.auto_fix_high,
                      color: Color.fromARGB(255, 151, 71, 255),
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 92, 225, 230),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    'Beauty',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.bloodtype,
                      color: Color.fromARGB(255, 151, 71, 255),
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 92, 225, 230),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                    'Donate',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
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
                  children: test
                      .map((item) => Card(
                                elevation: 10,
                                shadowColor:
                                    const Color.fromARGB(255, 92, 225, 230),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                    onTap: () {
                                      print("hi");
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
                              )
                          // Card(
                          //         child: Container(
                          //             decoration: const BoxDecoration(
                          //               image: DecorationImage(
                          //                 image: AssetImage(
                          //                     "assets/Exchange-logo.png"),
                          //                 fit: BoxFit.fitWidth,
                          //                 alignment: Alignment.bottomCenter,
                          //               ),
                          //             ),
                          //             child: Container(
                          //               alignment: Alignment.bottomCenter,
                          //               child: const Text("Exp:" + " 2022-12-31\n",
                          //                   style: TextStyle(
                          //                       color: Color.fromARGB(255, 0, 0, 0),
                          //                       fontSize: 20)),
                          //             )))
                          // Column(children: [
                          //       Card(
                          //           elevation: 10,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12)),
                          //           child: InkWell(
                          //               onTap: () {
                          //                 print("hi");
                          //               },
                          //               child: Column(children: [
                          //                 Image.asset("assets/Exchange-logo.png",
                          //                     fit: BoxFit.cover),
                          //                 Container(
                          //                   child: const Center(
                          //                     child: Text("item"),
                          //                   ),
                          //                 )
                          //               ]))),
                          //     ])
                          )
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
