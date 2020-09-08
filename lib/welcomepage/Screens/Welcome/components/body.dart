import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navaninew/welcomepage/Screens/Login/components/background.dart';
import 'package:navaninew/welcomepage/Screens/Login/login_screen.dart';
import 'package:navaninew/welcomepage/Screens/Signup/signup_screen.dart';
import 'package:navaninew/welcomepage/components/rounded_button.dart';
import 'package:navaninew/welcomepage/constants.dart';
// import 'package:flutter_auth/Screens/Login/login_screen.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
// import 'package:flutter_auth/Screens/Welcome/components/background.dart';
// import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/constants.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset(
              "images/black_logo.png",
              height: size.height * 0.41,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}