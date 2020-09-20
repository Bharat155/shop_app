import 'package:flutter/material.dart';
import '../main_home/home_screen.dart';
import 'login.dart';
import '../../constants.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  TextEditingController _emailController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  String email="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),),);
          },
        ),
        elevation: 0.0,
        title: Text(
          "Sneakers.in",
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value){
                  if (value.isEmpty){
                    return "Enter an Email";
                  }else{
                    email= value;
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Enter your Email",hintStyle: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                    border: UnderlineInputBorder()
                ),
              ),
              SizedBox(height: 20.0,),
              RawMaterialButton(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                fillColor: kPink,
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    print("Button Pressed");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(),),);
                  }
                },
                child: Text(
                  "Send Mail",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                ),
                constraints: BoxConstraints.tightFor(
                  width: double.infinity,
                  height: 56.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
