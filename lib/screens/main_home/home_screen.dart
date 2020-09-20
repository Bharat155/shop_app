import 'file:///C:/Users/Bharat%20Ahuja/AndroidStudioProjects/shop_app/lib/screens/main_home/home_page.dart';

import '../login_signup/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../login_signup/register.dart';
import 'home_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg-im2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Huge Collection of all\ntype of Sneakers in\nthe world.",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: 32.0,
                      color: Colors.white),
                ),
                SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Raised_Button(
                      label: "Register",
                      onnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Raised_Button(
                      label: "Login",
                      onnPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "or Continue with..",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SocialMedia(
                      icon: FontAwesomeIcons.google,
                      label: "Google",
                      onPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    ),
                    SocialMedia(
                      icon: FontAwesomeIcons.facebookF,
                      label: "Facebook",
                      onPress: (){
                        print("Working");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  SocialMedia({this.icon, this.label, this.onPress});
  final icon;
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}

class Raised_Button extends StatelessWidget {
  final String label;
  final Function onnPress;
  Raised_Button({this.label, this.onnPress});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150.0,
      child: RaisedButton(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onnPress,
        highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white)),
      ),
    );
  }
}
