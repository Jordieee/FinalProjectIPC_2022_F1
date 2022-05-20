import 'dart:convert';
import 'dart:ui';
import 'package:final_project_ipc/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project_ipc/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/product_details.dart';
import 'package:animated_button/animated_button.dart';
import '../model/teams_model.dart';

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
            const Spacer(flex: 1,),
            IconButton(
              iconSize: 40 ,
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                var route = MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username, password: password,),
                );
                Navigator.of(context).push(route);
              },)
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
          const FutureList()
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
            return AnimatedButton(
              shadowDegree: ShadowDegree.dark,
                onPressed: () {},
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
                    )));
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
