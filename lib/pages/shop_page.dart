import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  ShopPage({Key? key, this.image, this.desc, this.price}) : super(key: key);

  String? image;
  String? price;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(children: const [
            Text(
              "Your Cart",
              style: TextStyle(
                  fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold),
            )
          ])),
      body: ,
    );
  }
}
