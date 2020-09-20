import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "NIKE",
    "ADIDAS",
    "JORDAN",
    "PUMA",
    "REEBOK",
    "WOODLAND"
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin * 0.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 10.0, //extend the shadow
                      offset: Offset(30, 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalCategories extends StatefulWidget {
  @override
  _VerticalCategoriesState createState() => _VerticalCategoriesState();
}

class _VerticalCategoriesState extends State<VerticalCategories> {
  List<String> verticalCategories = ["New", "Featured", "Upcoming"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height * 0.43,
      width: MediaQuery.of(context).size.width * 0.06,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: verticalCategories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          verticalCategories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kTextColor : kTextLightColor,
          ),
        ),
      ),
    );
  }
}
