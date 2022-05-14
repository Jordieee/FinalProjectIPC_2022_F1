class Products {
  late List<Product> products;

  Products({required this.products});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  late String name;
  late double price;
  late String image;
  late String description;

  Product(
      {required this.name,
        required this.price,
        required this.image,
        required this.description});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
}




