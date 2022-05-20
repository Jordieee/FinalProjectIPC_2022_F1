import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
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
          title: Image.asset(
            'assets/img/f1store.png',
            width: 200,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/f12.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Profile(username: username, password: password)
        ]));
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.1,
      child: Container(
        width: 325,
        height: 325,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 1,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                  child: Image.asset(
                "assets/img/unknown.png",
                height: 150,
                width: 150,
              )),
              Text(username, style: const TextStyle(color:Colors.red, fontFamily: 'F1', fontSize: 30, fontWeight: FontWeight.bold),),
              const Spacer(flex: 2,),
              const Text("Your password: " , style: TextStyle(fontFamily: 'F1', fontSize: 20, fontWeight: FontWeight.bold),),
              Text(password, style: const TextStyle(color:Colors.red, fontSize: 15, fontWeight: FontWeight.bold)),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
