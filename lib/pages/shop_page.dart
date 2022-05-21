import 'dart:ui';
import 'package:flutter/material.dart';
import '../model/list_model.dart';

class ShopPage extends StatefulWidget {
  ShopPage(
      {Key? key, required this.image, required this.desc, required this.price})
      : super(key: key);

  String image;
  String price;
  String desc;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  static List<Product> list = [];
  static double total = 0;

  @override
  Widget build(BuildContext context) {
    Product p =
        Product(price: widget.price, image: widget.image, desc: widget.desc);
    if (widget.price != "" && widget.desc != "" && widget.image != "") {
      list.add(p);
      total = 0;
      for(int i=0; i<list.length; i++){
        total += double.parse(list[i].price);

      }
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(children:  [
            const Text(
              "Your Cart",
              style: TextStyle(
                  fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 50,),
            const Text(
              "Total: ",
              style: TextStyle(
                  fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
             double.parse((total).toStringAsFixed(2)).toString() + "€",
              style: const TextStyle(
                  fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ])),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(children: [
            const Divider(),
            ListTile(
              trailing: Image.asset(
                list[index].image,
                width: 100,
                height: 100,
              ),
              title:

                Column(children: [
                  Text(
                    list[index].desc,
                    style: const TextStyle(
                        fontFamily: 'F1',
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    list[index].price + "€",
                    style: const TextStyle(
                        fontFamily: 'F1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
              ]),
            ),
          ]);
        },
      ),

    );
  }
}
