import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 111, 8, 143),
        elevation: 20,
        title: const Text(
          'ExpChange',
          style: TextStyle(
            color: Color.fromARGB(200, 92, 225, 230),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        elevation: 3,
                        shadowColor: const Color.fromARGB(200, 92, 225, 230),
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
                        color: Color.fromARGB(200, 92, 225, 230),
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        elevation: 3,
                        shadowColor: const Color.fromARGB(200, 92, 225, 230),
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
                        color: Color.fromARGB(200, 92, 225, 230),
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        elevation: 3,
                        shadowColor: const Color.fromARGB(200, 92, 225, 230),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Text(
                      'Medicins',
                      style: TextStyle(
                        color: Color.fromARGB(200, 92, 225, 230),
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        elevation: 3,
                        shadowColor: const Color.fromARGB(200, 92, 225, 230),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: const Text(
                      'Skin care',
                      style: TextStyle(
                        color: Color.fromARGB(200, 92, 225, 230),
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
                        backgroundColor:
                            const Color.fromARGB(255, 224, 224, 224),
                        elevation: 3,
                        shadowColor: const Color.fromARGB(200, 92, 225, 230),
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
                        color: Color.fromARGB(200, 92, 225, 230),
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
                        flex: 1,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 224, 224, 224),
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
            )
          ],
        ),
      ),
    );
  }
}
