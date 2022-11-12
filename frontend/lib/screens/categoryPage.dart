import 'package:flutter/material.dart';
import 'package:frontend/screens/productsPage.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../services/rest_api.dart';

class CategoryPage extends StatefulWidget {
  var category;
  CategoryPage({super.key, required this.category});
  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState(category: category);
}

class _CategoryPageState extends State<CategoryPage> {
  final String category;

  _CategoryPageState({required this.category});
  List<dynamic> products = [];
  getProductByCategory() async {
    var data = await ApiService.getProductByCategory(category);
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: products.length > 0
              ? GridView(
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
                                        builder: (context) =>
                                            ProductPage(product: product)),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Image.network(
                                      'http://192.168.1.12:3000//uploads//${product['productPicture']}',
                                      width: 120,
                                      height: 120,
                                    ),
                                    Text(
                                        '${product['product_name']}-${product['category']}'),
                                    Text(
                                        'EXP:${product['expiry_date'].split('T')[0]}'),
                                  ],
                                )),
                          ))
                      .toList(),
                )
              : LiquidCircularProgressIndicator(
                  value: 0.55,
                  valueColor: const AlwaysStoppedAnimation(
                      Color.fromARGB(255, 112, 7, 126)),
                  backgroundColor: Colors.white,
                  borderColor: const Color.fromARGB(255, 54, 164, 172),
                  borderWidth: 5.0,
                  center: const Text("Loading..."),
                ),
        )
      ],
    );
  }
}
