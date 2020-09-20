import 'package:flutter/material.dart';
import '../../models/Product.dart';
import '../details_screen/details_screen.dart';
import 'components/reusable_card.dart';
import 'components/categories.dart';
import 'components/item_card.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Color colour = kTextLightColor;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalCategories(),
            SizedBox(width: 30),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ReusableCard(image: "shoes/shoe1.png",colour: Color(0xffe84148),name: "LEBRON-17-FP",price: "\$234",brand: "Nike"),
                    ReusableCard(image: "shoes/shoe1.png",colour: Color(0xffFDA7DF),name: "AIR-MAX",price: "\$234",brand: "Nike"),
                    ReusableCard(image: "shoes/shoe1.png",colour: Color(0xff12CBC4),name: "EPIC-REACT",price: "\$234",brand: "Nike"),
                    ReusableCard(image: "shoes/shoe1.png",colour: Color(0xff40739e),name: "AIR-270",price: "\$234",brand: "Nike"),
                    ReusableCard(image: "shoes/shoe1.png",colour: Color(0xffb2bec3),name: "AIR-FORCE-90",price: "\$234",brand: "Nike"),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        )),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
