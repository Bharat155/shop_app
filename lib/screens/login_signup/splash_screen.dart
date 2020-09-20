import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../main_home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller = AnimationController(
    duration: const Duration(
      seconds: 2,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff181818),
        body: Expanded(
          child: Lottie.asset(
            'assets/shoeAnim.json',
            fit: BoxFit.fill,
            controller: _controller,
          ),
        ));
  }
}
