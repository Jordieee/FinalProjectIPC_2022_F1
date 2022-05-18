import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    Key? key,

    required this.image,
    required this.heroTag,
  }) : super(key: key);

String image="";
  String heroTag="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Product Details"),
      ),

    );
  }
}
