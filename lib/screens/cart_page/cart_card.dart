import 'package:flutter/material.dart';
import '../details_screen/components/cart_counter.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [Image.asset('shoes/shoe1.png',fit: BoxFit.fill,),],
              ),
            ),
          ),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text("NIKE-AIR-270",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.6,color: Colors.black54),),
              SizedBox(height: 10),
              Text("\$234",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0.8),),
              SizedBox(height: 12),
              CartCounter(),
            ],
          ),
        ],
      ),
    );
  }
}
