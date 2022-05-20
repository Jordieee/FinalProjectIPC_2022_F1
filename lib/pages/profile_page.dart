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
        ]));
  }
}
