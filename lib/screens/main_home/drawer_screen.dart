import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'body.dart';
import 'components/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:
              Alignment(0.8, 1.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xFFDA2D2D),
            const Color(0xFF000000)
          ], // whitish to gray
          // repeats the gradient over the canvas
        ),
      ),
      padding: EdgeInsets.only(top: 50, left: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/my.jpeg"),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bharat Ahuja",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text("Satna",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70))
                ],
              )
            ],
          ),
          SizedBox(
            height: 45.0,
          ),
          Column(
            children: draweritems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => element['press']));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  element['icon'],
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  element['title'],
                                  style: kTextStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Visit Us At",
                      style: kTextStyle,
                    ),
                  ],
                ),
              ),
              Row(
                children: socialButtons
                    .map((element) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () async {
                              if (await canLaunch(element['url'])) {
                                await launch(element['url']);
                              } else {
                                throw 'Could not launch ${element['url']}';
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  element['icon'],
                                  size: 30.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Map> socialButtons = [
  {
    'icon': MyFlutterApp.facebook,
    'url': 'https://www.facebook.com/bharat.ahuja.961/'
  },
  {
    'icon': MyFlutterApp.instagram,
    'url': 'https://www.instagram.com/ahuja_bharat51/'
  },
  {'icon': MyFlutterApp.twitter, 'url': 'https://twitter.com/BharatA34068611'},
];

List<Map> draweritems = [
  {'icon': FontAwesomeIcons.home, 'title': "Home", 'press': Body()},
  {'icon': FontAwesomeIcons.productHunt, 'title': "Products", 'press': Body()},
  {'icon': FontAwesomeIcons.shoppingBag, 'title': "My Bag", 'press': Body()},
  {'icon': FontAwesomeIcons.heart, 'title': "Wishlist", 'press': Body()},
  {'icon': Icons.settings, 'title': "Account Settings", 'press': Body()},
  {'icon': FontAwesomeIcons.bell, 'title': "Notifications", 'press': Body()},
  {'icon': Icons.info, 'title': "Help", 'press': Body()},
  {'icon': Icons.exit_to_app, 'title': "Log Out", 'press': Body()}
];

const kTextStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colors.white);
