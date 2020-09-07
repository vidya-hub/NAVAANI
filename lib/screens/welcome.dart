import 'package:flutter/material.dart';
import 'package:navaninew/screens/introscreen.dart';

class WelcomScreen extends StatefulWidget {

  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: IntroScreenNav(),
    );
  }
}