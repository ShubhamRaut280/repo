import 'package:flutter/material.dart';
import 'package:talk/screens/auth/login_screen.dart';
import 'package:talk/screens/home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

//global object for accesing screen size
late Size mq; //media query

void main() {
  // _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talk',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // app bar theme
        appBarTheme: const AppBarTheme(
            // elevation: 1,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      home: const LoginScreen(),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// _initializeFirebase() async {
//   //await -- gonna use more time  therefore the function is async(it will not wait for responce to execute further task)
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
