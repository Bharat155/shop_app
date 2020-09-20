import 'body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cart_page/cart_page.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(isDrawerOpen?-0.5:0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  isDrawerOpen?
                  IconButton(
                    icon: Icon(Icons.keyboard_backspace),
                    onPressed: (){
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                  )
                      :IconButton(icon:Icon(Icons.menu),
                    onPressed: (){
                      setState(() {
                        xOffset =250;
                        yOffset=120;
                        scaleFactor=0.7;
                        isDrawerOpen=true;
                      });
                    },
                  ),
                  Text(
                    "Sneakers.in",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.black54, size: 30),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(),),),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black54, size: 30),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.black54, size: 30),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(),),),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(child: Body()),
        ],
      ),

    );
  }
}

