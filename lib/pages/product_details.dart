import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

import 'package:final_project_ipc/model/teams_model.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    Key? key,
    required this.team,
    required this.heroTag,

  }) : super(key: key);

  String heroTag;
  Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              team.name,
              style: const TextStyle(
                  fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold),
            )),
        body: Stack(children: <Widget>[
          Hero(
            tag: heroTag,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(team.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 370,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
              child:
                  Products(team: team)

            ),
          )
        ]));
  }
}

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          children: [
            Image.asset(team.shirtimage, width: 400, height: 400,),
            Text(team.shirtdesc),
            Text(team.shirtprice),
            AnimatedButton(onPressed: () {  }, child: Text("Add to cart"),)
          ],
        ),
        Column(
          children: [
            Image.asset(team.capimage, width: 400, height: 400,),
            Text(team.capdesc),
            Text(team.capprice),
            AnimatedButton(onPressed: () {  }, child: Text("Add to cart"),)
          ],
        ),
        Column(
          children: [
            Image.asset(team.helmetimage, width: 400, height: 400,),
            Text(team.helmetdesc),
            Text(team.helmetprice),
            AnimatedButton(onPressed: () {  }, child: Text("Add to cart"),)
          ],
        ),
        Column(
          children: [
            Image.asset(team.carimage, width: 400, height: 400,),
            Text(team.cardesc),
            Text(team.carprice),
            AnimatedButton(onPressed: () {  }, child: Text("Add to cart"),)
          ],
        )
      ],

    );
  }
}
