import 'package:flutter/material.dart';
import 'package:talk/screens/home_screen.dart';
import '../../main.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // for hiding all leadin icons
        title: Text('Welcome to Talk'),
      ),
      body: Stack(children: [
        Positioned(
            // top: 50,
            // left: 100,
            // right: 100,
            // without mediaquery
            top: mq.height * .08,
            left: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
              'images/talk.png',
              scale: 3,
            )),
        Positioned(
            bottom: mq.height * .30,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shape: StadiumBorder(),
                  elevation: 1),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            HomeScreen())); // navigator push replacement for not coming to login page once u have logged in
              },
              icon: Image.asset(
                'images/google.png',
                height: mq.height * .038,
                width: mq.width * .11,
              ),
              label: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: [
                    TextSpan(text: 'Sign in with'),
                    TextSpan(
                        text: ' Google',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ])),
            ))
      ]),
    );
  }
}
