import '../main_home/home_screen.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import '../main_home/home_page.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passswordcontroller = TextEditingController();
  TextEditingController _confirmPasswordcontroller = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  bool _isChecked = false;
  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            onPressed: () {
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
        body:Builder(
          builder: (context)=>SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FormField(
                          label: "FIRST NAME",
                          text: false,
                          controller: _firstNameController,
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: FormField(
                          label: "LAST NAME",
                          text: false,
                          controller: _lastNameController,
                        ),
                      ),
                    ],
                  ),
                  FormField(
                    label: "DATE OF BIRTH",
                    text: false,
                    controller: _dobController,
                  ),
                  FormField(
                    label: "EMAIL",
                    text: false,
                    controller: _emailcontroller,
                  ),
                  FormField(
                    label: "PASSWORD",
                    text: true,
                    controller: _passswordcontroller,
                  ),
                  FormField(
                    label: "CONFIRM PASSWORD",
                    text: true,
                    controller: _confirmPasswordcontroller,
                  ),
                  Row(
                    children: <Widget>[
                      new Checkbox(
                        value: _isChecked,
                        onChanged: (bool value) {
                          onChanged(value);
                        },
                      ),
                      Text("By signing up, you agree to Terms of Use"),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RawMaterialButton(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    fillColor: kPink,
                    onPressed: () {
                      if (_passswordcontroller.text ==
                          _confirmPasswordcontroller.text) {
                        print("Password match");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      } else {
                        print("Password do not match");
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Passwords do not match"),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: Text(
                      "CREATE ACCOUNT",
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
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Center(
                      child: Text("Already a Member ? Sign in",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: Text("or Register with",
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
                        onPress: (){
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
                        onPress: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45.0,
        width: 1.0,
        color: Colors.black45,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool text;
  FormField({this.label, this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14.0,
                fontWeight: FontWeight.w700),
          ),
          TextFormField(
            controller: controller,
            autofocus: false,
            obscureText: text,
            autocorrect: false,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18.0,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final Color colour;
  final IconData icon;
  final Function onPress;

  SocialButton({this.icon, this.label, this.colour,this.onPress});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150.0,
      height: 45.0,
      child: RaisedButton(
        onPressed: onPress,
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
