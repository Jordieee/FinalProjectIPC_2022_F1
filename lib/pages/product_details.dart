import 'dart:ui';
import 'package:final_project_ipc/pages/shop_page.dart';
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
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Products(team: team)),
          ),
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
            Image.asset(
              team.shirtimage,
              width: 400,
              height: 400,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "'' " + team.shirtdesc + " ''",
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                team.shirtprice,
                style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'F1',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              AnimatedButton(
                color: Colors.black,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _createAlert(context, team.shirtimage, team.shirtdesc, team.shirtprice)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'F1',
                            fontSize: 20),
                      )
                    ]),
              ),
            ])
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          children: [
            Image.asset(
              team.capimage,
              width: 400,
              height: 400,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "'' " + team.capdesc + " ''",
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                team.capprice,
                style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'F1',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              AnimatedButton(
                color: Colors.black,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _createAlert(context, team.capimage, team.capdesc, team.capprice)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'F1',
                            fontSize: 20),
                      )
                    ]),
              ),
            ])
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          children: [
            Image.asset(
              team.helmetimage,
              width: 400,
              height: 400,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "'' " + team.helmetdesc + " ''",
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                team.helmetprice,
                style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'F1',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              AnimatedButton(
                color: Colors.black,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _createAlert(context, team.helmetimage, team.helmetdesc, team.helmetprice)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'F1',
                            fontSize: 20),
                      )
                    ]),
              ),
            ])
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          children: [
            Image.asset(
              team.carimage,
              width: 400,
              height: 400,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "'' " + team.cardesc + " ''",
              style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                team.carprice,
                style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'F1',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              AnimatedButton(
                color: Colors.black,
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _createAlert(context, team.carimage, team.cardesc, team.carprice)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'F1',
                            fontSize: 20),
                      )
                    ]),
              ),
            ])
          ],
        ),
      ],
    );
  }
}

AlertDialog _createAlert(BuildContext context, String image, String desc, String price) => AlertDialog(
      title: const Text("Confirm Action"),
      content: SizedBox(
        width: 200,
        height: 130,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Do you want to add", style: TextStyle(fontSize: 20, fontFamily: 'F1')),
              const SizedBox(height: 10,),
              Text("'"+desc+"'",textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontFamily: 'F1', fontSize: 20, fontStyle: FontStyle.italic)),
              const SizedBox(height: 10,),
              const Text("to your cart?", style: TextStyle(fontSize: 20, fontFamily: 'F1')),
              Container(
                width: 200,
                height: 5,
                color: Colors.blueGrey,
              ),

            ],
          ),
        ]),
      ),
      actions: [
        AnimatedButton(
          width: 100,
          height: 30,
          color: Colors.red,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("NO", style: TextStyle(color: Colors.white, fontFamily: 'F1', fontWeight: FontWeight.bold, fontSize: 20),),),
        AnimatedButton(
            width: 100,
            height: 30,
          color: Colors.green,
            onPressed: () {
              var route = MaterialPageRoute(
                  builder: (context) => ShopPage(
                    image: image,
                    desc: desc,
                    price: price,
                      ));
              Navigator.of(context).pop();
              Navigator.of(context).push(route);
            },
            child: const Text("YES", style: TextStyle(color: Colors.white, fontFamily: 'F1', fontWeight: FontWeight.bold, fontSize: 20),)),
      ],
    );
