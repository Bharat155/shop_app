import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Bharat%20Ahuja/AndroidStudioProjects/shop_app/lib/screens/payment_page/upi_payment.dart';
import '../../models/Product.dart';
import 'cart_card.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cart = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, color: Colors.black, size: 30),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sneakers.in",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Bag",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total 3 items",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    CartCard(),
                    CartCard(),
                    CartCard(),
                    CartCard(),
                    CartCard(),
                    CartCard(),
                  ],
                )),
          )
        ],
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$510.0",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(child: buildRaisedButton())
          ],
        ),
      ),
    );
  }

  Container buildRaisedButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: RaisedButton(
        color: Colors.pinkAccent,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UPIPayment()));
        },
        child: Text(
          "CHECKOUT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
