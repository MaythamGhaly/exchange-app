class Product {
  final String id;
  final String product_name;
  final String expiry_date;
  final String productPicture;
  final String description;
  final String category;
  final bool approved;
  final bool deal_done;
  final String user;

  Product({
    required this.id,
    required this.product_name,
    required this.expiry_date,
    required this.productPicture,
    required this.description,
    required this.category,
    required this.approved,
    required this.deal_done,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product_name': product_name,
      'expiry_date': expiry_date,
      'productPicture': productPicture,
      'description': description,
      'category': category,
      'approved': approved,
      'deal_done': deal_done,
      'user': user,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      product_name: json['product_name'],
      expiry_date: json['expiry_date'],
      productPicture: json['productPicture'],
      description: json['description'],
      category: json['category'],
      approved: json['approved'],
      deal_done: json['deal_done'],
      user: json['user'],
    );
  }
}
