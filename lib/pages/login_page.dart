import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/list_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Column(children: [
            _Header(),
            const Spacer(flex: 1),
            _Body(),
            const Spacer(flex: 1),
            _Footer(context),
            const Spacer(flex: 10),
          ]),
        ),
      ]),
    );
  }

  SizedBox _Header() {
    return SizedBox(
        width: double.infinity,
        height: 125,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          Spacer(
            flex: 1,
          ),
          Text("SIGN IN",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          Spacer(
            flex: 5,
          ),
        ]));
  }
}

Container _Body() {
  return Container(
      width: 325,
      height: 230,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.indigo),
                    labelText: 'Username',
                  ),
                ),
              )
            ],
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.keyboard_outlined, color: Colors.indigo),
                    labelText: 'Password',
                  ),
                ),
              )
            ],
          ),
          const Spacer(flex: 4),
        ],
      ));
}

SizedBox _Footer(BuildContext context) {
  return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(
          child: Container(
              width: 150,
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('SIGN IN',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ))
                  ])),
          onTap: () {
            var route = MaterialPageRoute(
              builder: (context) => ListPage(),
            );
            Navigator.of(context).push(route);
          },
        )
      ]));
}
