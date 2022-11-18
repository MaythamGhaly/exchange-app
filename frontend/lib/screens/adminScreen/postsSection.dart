import 'package:flutter/material.dart';

import '../../services/rest_api.dart';

class postsSections extends StatefulWidget {
  postsSections({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _postsSectionsState createState() => _postsSectionsState();
}

class _postsSectionsState extends State<postsSections> {
  List<dynamic> products = [];

  getPosts() async {
    var data = await ApiService.getPosts();
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 500,
          child: products.length > 0
              ? GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // number of items per row
                    crossAxisCount: 1,
                    // vertical spacing between the items
                    mainAxisSpacing: 10,
                    // horizontal spacing between the items
                    crossAxisSpacing: 10,
                  ),
                  children: products
                      .map((product) => Container(
                            height: 500,
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 0),
                              semanticContainer: true,
                              elevation: 10,
                              shadowColor:
                                  const Color.fromARGB(255, 92, 225, 230),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Image.network(
                                    'http://192.168.137.1:3000//uploads//${product['productPicture']}',
                                    width: 140,
                                    height: 140,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                        '${product['product_name']}-${product['category']}'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                        'EXP  : ${product['expiry_date'].split('T')[0]}'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text('${product['description']}'),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(0),
                                    child: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        await ApiService.deletePost(
                                            context, product['_id']);
                                        getPosts();
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(0),
                                    child: IconButton(
                                      icon: const Icon(Icons.done),
                                      onPressed: () async {
                                        await ApiService.approvePost(
                                            context, product['_id']);
                                        getPosts();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )
              : const Center(
                  child: Text('No Posts'),
                ),
        )
      ],
    );
  }
}
