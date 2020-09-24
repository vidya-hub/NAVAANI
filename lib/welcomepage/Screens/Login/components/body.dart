import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:http/http.dart' as http;
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/welcomepage/Screens/Login/components/background.dart';
import 'package:navaninew/welcomepage/Screens/Signup/signup_screen.dart';
import 'package:navaninew/welcomepage/Screens/forgotpassword.dart';
import 'package:navaninew/welcomepage/components/already_have_an_account_acheck.dart';
import 'package:navaninew/welcomepage/components/rounded_button.dart';
import 'package:navaninew/welcomepage/components/text_field_container.dart';
import 'package:navaninew/welcomepage/constants.dart';
import 'package:navaninew/constant/cartwishlistid.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var urlOriginal = "https://whispering-garden-19030.herokuapp.com/users";

  var urlRegister =
      "https://whispering-garden-19030.herokuapp.com/users/register";

  var allUsersUrl =
      "https://whispering-garden-19030.herokuapp.com/users/allusers";

  String usernameCheck =
      "https://whispering-garden-19030.herokuapp.com/users/check";

  TextEditingController _userName = TextEditingController();

  TextEditingController _passWord = TextEditingController();

  Future allusers() async {
    var all_users_response = await http.get(allUsersUrl);
    print('Response status: ${all_users_response.statusCode}');
    print('Response body: ${all_users_response.body}');
  }

  Future checkUsername(String username) async {
    var all_users = await http.get("$usernameCheck/$username");

    // print("$usernameCheck/$username");
    // print('Response status: ${all_users.statusCode}');
    return all_users.body;
  }

  Future<dynamic> logIn_api(String username, String password) async {
    var login_response =
        await http.get("$urlOriginal/login/$username/pass/$password");
    return login_response.body;
  }

  String helpertext;
  bool incorrect = false;
  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "icons/login.svg",
              height: size.height * 0.35,
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
                controller: _passWord,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
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
                        "Password Incorrect",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      SizedBox(width: size.width * 0.03),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPassword();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Forgot",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                : Container(),
            _isProgress == true
                ? Center(child: CircularProgressIndicator())
                : RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      setState(() {
                        _isProgress = true;
                      });

                      var loginbody = await logIn_api(
                          _userName.text.trim(), _passWord.text.trim());
                      if (loginbody != "[]") {
                        print(json.decode(loginbody)[0]['_id']);
                        setState(() {
                          Cartwishlist.userid =
                              json.decode(loginbody)[0]['_id'];
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(
                                userId: json.decode(loginbody)[0]['_id'],
                              );
                            },
                          ),
                        );
                      } else {
                        print("null data");
                        // print(await checkUsername(_userName.text));
                        if (await checkUsername(_userName.text.trim()) ==
                            "false") {
                          // user is there
                          print("password is not correct");
                          setState(() {
                            incorrect = true; //password is not correct
                            helpertext = null;
                          });
                        } else if (await checkUsername(_userName.text.trim()) ==
                            "true") {
                          // user is not there
                          print("username is not correct");
                          setState(() {
                            helpertext = "User Name Is Incorrect";
                            //User Name Is Incorrect
                            incorrect = false;
                          });
                        }
                      }
                      setState(() {
                        _isProgress = false;
                      });
                    },
                  ),
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
    );
  }
}
