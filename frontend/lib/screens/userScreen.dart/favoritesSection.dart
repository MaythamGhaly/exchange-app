import 'package:flutter/material.dart';
import 'package:frontend/screens/userScreen.dart/productsPage.dart';

import '../../services/rest_api.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<dynamic> products = [];

  getFavorites() async {
    var data = await ApiService.getFavorites();
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            height: 400,
            child: products.length > 0
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
                                              product: product['product'])),
                                    );
                                  },
                                  child: Stack(children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            'http://192.168.137.1:3000//uploads//${product['product']['productPicture']}',
                                            width: 120,
                                            height: 120,
                                          ),
                                          Text(
                                              '${product['product']['product_name']}-${product['product']['category']}'),
                                          Text(
                                              'EXP:${product['product']['expiry_date'].split('T')[0]}'),
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
                                          await ApiService.deleteFavorite(
                                              context,
                                              product['product']['_id']);
                                          getFavorites();
                                        },
                                      ),
                                    ),
                                  ])),
                            ))
                        .toList(),
                  )
                : const Center(
                    child: Text("No Favorites"),
                  ))
      ],
    );
  }
}
