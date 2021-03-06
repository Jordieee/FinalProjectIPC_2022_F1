
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:final_project_ipc/pages/list_page.dart';

class WaitPage extends StatelessWidget {
  WaitPage({
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
            fit: BoxFit.fill,
          ),
        ),
        body: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/f1night.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'F1',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Welcome to F1 Official Shop',
                      speed: const Duration(milliseconds: 100),
                    ),
                    TyperAnimatedText(
                      'We are so happy to see you ' + username,
                      speed: const Duration(milliseconds: 100),
                    ),
                    TyperAnimatedText(
                      'Loading your information...',
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  onFinished: () {
                    var route = MaterialPageRoute(
                      builder: (context) => ListPage(username: username, password: password,),
                    );
                    Navigator.of(context).push(route);
                  },
                ),
              ),
            ),
          ),
          SpinKitWave(
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              );
            },
          )
        ]));
  }
}
