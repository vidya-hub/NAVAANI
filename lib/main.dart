import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/screens/welcome.dart';
import 'package:navaninew/welcomepage/Screens/Welcome/welcome_screen.dart';

// import 'package:navaninew/navigation_bloc.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:WelcomeScreen(),
      ),
    );
  }
}
