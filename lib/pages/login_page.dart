
import 'package:flutter/material.dart';
import 'package:final_project_ipc/pages/list_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_project_ipc/pages/waiting_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static String username="";

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
            const Spacer(flex: 200),
          ]),
        ),
      ]),
    );
  }

  Widget _Header() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

          const Text("SIGN IN",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'F1',
                fontWeight: FontWeight.bold,
              )),

          SvgPicture.asset(
            'assets/img/f1.svg',
          ),

        ]),
      ),
      const Divider(
          color: Colors.grey, thickness: 1, indent: 40, endIndent: 40),

    ]);
  }
}

Widget _Body() {

  return SizedBox(
      width: 325,
      height: 230,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 5),
          const Text("Username",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'F1',
              )),
          const Spacer(flex: 1),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  child: TextField(
                    onChanged: (newUsername) {
                      LoginPage.username = newUsername;
                    },
                    obscureText: false,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Enter your username",
                      labelStyle: const TextStyle(
                          color: Colors.grey
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ))
            ],
          ),
          const Spacer(flex: 3),
          const Text("Password",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'F1',
              )),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Password()
            ],
          ),
          const Spacer(flex: 4),
        ],
      ));
}

class Password extends StatefulWidget {
  const Password({
    Key? key,
  }) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool icon = false;
  bool obscure = true;
  static String password="";


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: TextField(
          onChanged: (newPassword){
             password = newPassword;
          },
          obscureText: obscure,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: TextButton.icon(
                label: const Text(''),
                icon: icon ? const Icon(Icons.remove_red_eye, color: Colors.black,) : const Icon(Icons.visibility_off, color: Colors.black,),
                onPressed: () { setState(() {
                  icon = !icon;
                  obscure = !obscure;
                }); },),
            labelText: "Enter your password",
            labelStyle: const TextStyle(
                color: Colors.grey
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}

Widget _Footer(BuildContext context) {
  return Button();
}

class Button extends StatefulWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            pressed = true;
          });
          var route = MaterialPageRoute(
            builder: (context) => WaitPage(username: LoginPage.username, password: _PasswordState.password,),
          );
          Navigator.of(context).push(route);
        },

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(pressed ? Colors.white : Colors.red),
        ),
        child: Text(
          "SIGN IN",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'F1',
              color: pressed ? Colors.red : Colors.white,
              fontSize: 15),
        ));
  }
}

