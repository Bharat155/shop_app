import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Color colour;
  final String image;
  final String name;
  final String price;
  final String brand;
  ReusableCard({this.image, this.colour, this.name,this.brand,this.price});

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width * 0.58,
            decoration: BoxDecoration(
                color: widget.colour, borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        Positioned(
          left: 180,
          top: 15,
          child: Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.white : Colors.white60),
              onPressed:()=> _pressed(),
            ),
          ),
        ),
        Positioned(
          left: 25,
          top: 25,
          child: Container(
            alignment: Alignment.topRight,
            child: Text(
              widget.brand,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70
              ),
            ),
          ),
        ),
        Positioned(
          left: 25,
          top: 50,
          child: Text(
            widget.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Positioned(
          left: 25,
          top: 80,
          child: Text(
            widget.price,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 17.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        Positioned(
          top: 125,
          left: 55,
          child: Image.asset(widget.image, width: 180, height: 150),
        )
      ],
    );
  }

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }
}
