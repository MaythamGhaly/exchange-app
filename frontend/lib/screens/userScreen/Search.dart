import 'package:flutter/material.dart';
import 'package:frontend/screens/userScreen.dart/productsPage.dart';
import 'package:frontend/services/rest_api.dart';
import 'package:provider/provider.dart';
import '../../../provider/dark_theme_provider.dart';

class search extends StatefulWidget {
  String product_name;
  search({super.key, required this.product_name});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  late TabController _controller;
  List<dynamic> products = [];
  late String product_name;

  Future search() async {
    var data = await ApiService.search(product_name);
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    product_name = widget.product_name;
    search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themesState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          shadowColor: const Color.fromARGB(255, 111, 8, 143),
          elevation: 20,
          title: const Text(
            'Search ',
            style: TextStyle(
              color: Color.fromARGB(200, 92, 225, 230),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const BackButton(
            color: Color.fromARGB(255, 111, 8, 143),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                height: 400,
                child: products != null
                    ? GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                              builder: (context) => ProductPage(
                                                  product: product)),
                                        );
                                      },
                                      child: Stack(children: [
                                        Center(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                'http://192.168.137.1:3000//uploads//${product['productPicture']}',
                                                width: 120,
                                                height: 120,
                                              ),
                                              Text(
                                                  '${product['product_name']}-${product['category']}'),
                                              Text(
                                                  'EXP:${product['expiry_date'].split('T')[0]}'),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                            iconSize: 25,
                                            icon: const Icon(Icons.favorite),
                                            color: const Color.fromARGB(
                                                255, 85, 20, 170),
                                            onPressed: () async {
                                              await ApiService.addFavorites(
                                                  context, product['_id']);
                                            },
                                          ),
                                        ),
                                      ])),
                                ))
                            .toList(),
                      )
                    : const Center(
                        child: Text('No Products Found'),
                      ))
          ],
        )));
  }
}
