import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:final_project_ipc/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/product_details.dart';

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
          title: Image.asset(
            'assets/img/f1store.png',
            width: 200,
            height: 30,
            fit: BoxFit.cover,
          ),
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
            return IconButton(

              onPressed: () {  },
              icon: Hero(
                tag: "image_${teams.image}",
                child: Image.asset(teams.image),


              ),

            );
          }).toList();

          return GridView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) => list[i],
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
