import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;
import 'package:navaninew/welcomepage/Screens/Login/components/background.dart';
import 'package:navaninew/welcomepage/Screens/Login/login_screen.dart';
import 'package:navaninew/welcomepage/Screens/Signup/signup_screen.dart';
import 'package:navaninew/welcomepage/components/already_have_an_account_acheck.dart';
import 'package:navaninew/welcomepage/components/rounded_button.dart';
import 'package:navaninew/welcomepage/components/text_field_container.dart';
import 'package:navaninew/welcomepage/constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var urlOriginal = "https://whispering-garden-19030.herokuapp.com/users";

  String usernameCheck =
      "https://whispering-garden-19030.herokuapp.com/users/check";

  String forgotpasswordapi =
      "https://whispering-garden-19030.herokuapp.com/users/forgot";

  TextEditingController _userName = TextEditingController();

  TextEditingController _firstpass = TextEditingController();
  TextEditingController _secondpass = TextEditingController();

  Future checkUsername(String username) async {
    var all_users = await http.get("$usernameCheck/$username");

    // print("$usernameCheck/$username");
    // print('Response status: ${all_users.statusCode}');
    return all_users.body;
  }

  Future forgotpasswordFun(String username, Map<String, String> body) async {
    var modifiedUser = await http.patch("$forgotpasswordapi/$username",
        headers: {"Content-type": "application/json"}, body: json.encode(body));

    return modifiedUser.body;
  }

  Future<dynamic> logIn_api(String username, String password) async {
    var login_response =
        await http.get("$urlOriginal/login/$username/pass/$password");
    return login_response.body;
  }

  String helpertext;
  bool incorrect = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "FORGOT PASSWORD",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "icons/login.svg",
                height: size.height * 0.3,
              ),
              SizedBox(height: size.height * 0.03),
              TextFieldContainer(
                child: TextField(
                  controller: _userName,
                  // onChanged: (value) {
                  //   print(value);
                  // },

                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Your User Name",
                    helperText: helpertext,
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    // hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: _firstpass,
                  // onChanged: (value) {
                  //   print(value);
                  // },
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ),
                    hintText: "Enter Password",
                    // helperText: helpertext,
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    // hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: _secondpass,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kPrimaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              incorrect
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Passwords Not Matched",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    )
                  : Container(),
              RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    if (_firstpass.text.trim() == _secondpass.text.trim()) {
                      setState(() {
                        incorrect = false;
                      });

                      if (await checkUsername(_userName.text.trim()) ==
                          "false") {
                        setState(() {
                          helpertext = null;
                        });
                        Map<String, String> body = {
                          "password": _firstpass.text.trim(),
                        };
                        var modifiedUser_body = await forgotpasswordFun(
                            _userName.text.trim(), body);

                        var loginbody = await logIn_api(
                            _userName.text.trim(), _firstpass.text.trim());

                        print(json.decode(loginbody)[0]['_id']);
                        print(modifiedUser_body);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      } else {
                        setState(() {
                          helpertext = "User Name Is Incorrect";
                        });
                      }
                    } else {
                      setState(() {
                        incorrect = true;
                      });
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
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
      ),
    );
  }
}
