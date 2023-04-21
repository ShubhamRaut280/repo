import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talk/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/APIs.dart';
import '../../helper/dialogs.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mq;

  _handleGoogleBtnClick() {
    // for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async{
      // for hiding progress bar
      Navigator.pop(context);
      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if((await APIs.userExist()))
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          }
        else
          {
            await APIs.createUser().then((value) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            });
          }


      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('_signInWithGoogle(): $e');
      Dialogs.showSnackbar(
          context, 'Something went wrong, check your internet connection.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome to Gupshup'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .08,
            left: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset(
              'images/talk.png',
              scale: 3,
            ),
          ),
          Center(
            child: Positioned(
              bottom: mq.height * .30,
              left: mq.width * .05,
              width: mq.width * .7,
              height: mq.height * .048,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen.shade200,
                  shape: StadiumBorder(),
                  elevation: 2,
                  alignment: Alignment.center,
                ),
                onPressed: _handleGoogleBtnClick,
                icon: Image.asset(
                  'images/google.png',
                  height: mq.height * .027,
                  width: mq.width * .06,
                ),
                label: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(text: 'Sign in with'),
                      TextSpan(
                        text: ' Google',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
