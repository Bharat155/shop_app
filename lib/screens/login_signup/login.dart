import '../../constants.dart';
import 'forgot_pass.dart';
import '../main_home/home_page.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import '../main_home/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passswordcontroller = TextEditingController();

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("EMAIL",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700)),
              TextFormField(
                controller: _emailcontroller,
                autofocus: false,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "PASSWORD",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
              TextFormField(
                controller: _passswordcontroller,
                autofocus: false,
                autocorrect: false,
                obscureText: true,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ForgotPass(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'Lato', fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              RawMaterialButton(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                fillColor: kPink,
                onPressed: () {},
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                constraints: BoxConstraints.tightFor(
                  width: double.infinity,
                  height: 56.0,
                ),
              ),
              SizedBox(height: 20.0),
              ButtonTheme(
                minWidth: double.infinity,
                height: 56.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("JOIN NOW !",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600)),
                  ),
                  onPressed: () {},
                  highlightColor: kPink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black, width: 2.5)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text("or Login with",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialButton(
                    icon: FontAwesomeIcons.facebookF,
                    label: "Facebook",
                    colour: Color(0xFF3b5998),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  SocialButton(
                    icon: FontAwesomeIcons.google,
                    label: "Google",
                    colour: Color(0xFFDB4437),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final Color colour;
  final IconData icon;
  final Function onPressed;

  SocialButton({this.icon, this.label, this.colour, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150.0,
      height: 45.0,
      child: RaisedButton(
        onPressed: onPressed,
        color: colour,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 20.0,
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
      ),
    );
  }
}