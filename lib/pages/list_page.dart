import 'dart:convert';

import 'package:final_project_ipc/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/product_details.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.indigo,
        ),
        body: const FutureList());
  }
}

class FutureList extends StatelessWidget {
  const FutureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/json/products.json"),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = json.decode(snapshot.data!);
          var products = Products.fromJson(data);
          final list = products.products.map((products) {
            return Column(children: [
              const Divider(),
              ListTile(
                trailing: const Icon(Icons.chevron_right,
                    color: Colors.grey, size: 50.0),
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products.name),
                      Text(
                        "${products.price}€",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ]),
                leading: Hero(
                    tag: "image_${products.image}",
                    child: Image.asset(
                      products.image,
                      width: 100,
                      height: 100,
                    )),
                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      name: products.name,
                      price: products.price,
                      description: products.description,
                      image: products.image,
                      heroTag: "image_${products.image}",
                    ),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            ]);
          }).toList();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) => list[i],
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
