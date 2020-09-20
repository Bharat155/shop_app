import 'package:flutter/material.dart';
import 'drawer_screen.dart';
import 'home_main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          DrawerScreen(),
          HomeMain()
        ],
      ),
    );
  }
}
