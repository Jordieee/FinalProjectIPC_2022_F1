class Shops {
  late List<Shop> shops;

  Shops({required this.shops});

  Shops.fromJson(Map<String, dynamic> json) {
    if (json['shops'] != null) {
      shops = <Shop>[];
      json['shops'].forEach((v) {
        shops.add(Shop.fromJson(v));
      });
    }
  }
}

class Shop {
  late String team;
  late String image;

  Shop(
      {required this.team,
        required this.image,});

  Shop.fromJson(Map<String, dynamic> json) {
    team = json['team'];
    image = json['image'];
  }
}




