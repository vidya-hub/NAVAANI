import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/welcomepage/Screens/Login/components/background.dart';
import 'package:navaninew/welcomepage/Screens/Login/login_screen.dart';
import 'package:navaninew/welcomepage/Screens/Signup/components/or_divider.dart';
import 'package:navaninew/welcomepage/Screens/Signup/components/social_icon.dart';
import 'package:navaninew/welcomepage/components/already_have_an_account_acheck.dart';
import 'package:navaninew/welcomepage/components/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'package:navaninew/welcomepage/components/text_field_container.dart';
import 'package:navaninew/welcomepage/constants.dart';

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

  TextEditingController _userName = TextEditingController();

  TextEditingController _passWord = TextEditingController();

  Future regisTer(Map<String, String> body) async {
    var registerResponse = await http.post(urlRegister,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    var userId = json.decode(registerResponse.body)["_id"];
    print(userId);
    return userId;
  }

  Future allusers_info() async {
    var all_users_response = await http.get(allUsersUrl);
    print('Response status: ${all_users_response.statusCode}');
    print('Response body: ${all_users_response.body}');
  }

  String usernameCheck =
      "https://whispering-garden-19030.herokuapp.com/users/check";

  Future checkUsername(String username) async {
    var all_users = await http.get("$usernameCheck/$username");
    return all_users.body;
  }

  String helpertext;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "icons/signup.svg",
              height: size.height * 0.35,
            ),
            TextFieldContainer(
              child: TextField(
                controller: _userName,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  helperText: helpertext,
                  hintText: "User Name",
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
                // onChanged: (),
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
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                Map<String, String> body = {
                  "username": _userName.text.trim(),
                  "password": _passWord.text.trim(),
                };
                print((json.encode(body)));

                checkUsername(_userName.text).then((value) {
                  if (value == "false") {
                    setState(() {
                      helpertext = "User Name Is already There";
                    });
                  } else if (value == "true") {
                    regisTer(body)
                        .then((value) => {
                              print(value),
                              if (value != null)
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomeScreen(
                                          userId: value,
                                        );
                                      },
                                    ),
                                  )
                                }
                            })
                        .catchError((onError) {
                      print(onError);
                    });
                  }
                });

                //
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "icons/facebook.svg",
                  press: ()async {
                   await allusers_info();
                  },
                ),
                SocalIcon(
                  iconSrc: "icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
