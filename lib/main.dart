import 'package:flutter/material.dart';
import 'file:///C:/Users/Bharat%20Ahuja/AndroidStudioProjects/shop_app/lib/screens/main_home/home_screen.dart';
import 'screens/login_signup/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
