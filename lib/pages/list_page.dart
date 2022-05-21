import 'dart:convert';
import 'dart:ui';
import 'package:final_project_ipc/pages/profile_page.dart';
import 'package:final_project_ipc/pages/shop_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project_ipc/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/product_details.dart';
import 'package:animated_button/animated_button.dart';
import 'package:final_project_ipc/model/teams_model.dart';

class ListPage extends StatelessWidget {
  ListPage({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Row(children: [
            Image.asset(
              'assets/img/f1store.png',
              width: 200,
              height: 30,
              fit: BoxFit.cover,
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                var route = MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: username,
                    password: password,
                  ),
                );
                Navigator.of(context).push(route);
              },
            )
          ]),
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/f1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const FutureList(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: AnimatedButton(
                color: Colors.black,
                width: 60,
                height: 60,
                child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30,),
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (context) => ShopPage(image: "",desc: "",price: "")
                  );
                  Navigator.of(context).push(route);
                  },

              ),
            ),
          )
        ]));
  }
}

class FutureList extends StatelessWidget {
  const FutureList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString("assets/json/teams.json"),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = json.decode(snapshot.data!);
          var teams = Teams.fromJson(data);
          final list = teams.teams.map((teams) {
            return Center(
              child: AnimatedButton(
                  shadowDegree: ShadowDegree.dark,
                  onPressed: () {
                    Team team = Team(
                      name: teams.name,
                      image: teams.image,
                      shirtimage: teams.shirtimage,
                      shirtdesc: teams.shirtdesc,
                      shirtprice: teams.shirtprice,
                      capimage: teams.capimage,
                      capdesc: teams.capdesc,
                      capprice: teams.capprice,
                      helmetimage: teams.helmetimage,
                      helmetdesc: teams.helmetdesc,
                      helmetprice: teams.helmetprice,
                      carimage: teams.carimage,
                      cardesc: teams.cardesc,
                      carprice: teams.carprice,
                    );
                    var route = MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                        heroTag: "image_${teams.image}",
                        team: team,
                      ),
                    );
                    Navigator.of(context).push(route);
                  },
                  height: 120,
                  width: 185,
                  child: Hero(
                      tag: "image_${teams.image}",
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(teams.image))),
                      ))),
            );
          }).toList();

          return GridView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) => list[i],
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
