import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk'),
        leading: Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 15, right: 10),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.person_add_alt_1),
        ),
      ),
    );
  }
}
