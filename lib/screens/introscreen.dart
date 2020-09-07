import 'package:flutter/material.dart';
import 'package:navaninew/HomeScreen.dart';

class IntroScreenNav extends StatefulWidget {
  @override
  _IntroScreenNavState createState() => _IntroScreenNavState();
}

class _IntroScreenNavState extends State<IntroScreenNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(
              "images/bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30, top: 40),
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  PageView(
                    allowImplicitScrolling: true,
                    children: <Widget>[
                      FirstPage(),
                      // SecondPage(),
                      // ThirdPage(),
                      // FourthPage(),
                      // FifthPage(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // alignment: Alignment.bottomRight,
                        // height: MediaQuery.of(context).size.height * 0.13,
                        color: Colors.transparent,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 150, right: 22),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OtpEntering(),
                              //   ),
                              // );
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(212, 56, 57, 1),
                                    border: Border.all(color: Colors.white38),
                                    borderRadius: BorderRadius.circular(15)),
                                // padding: EdgeInsets.only(left: 16),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Center(
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // alignment: Alignment.bottomRight,
                        // height: MediaQuery.of(context).size.height * 0.13,
                        color: Colors.transparent,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 150, right: 22),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OtpEntering(),
                              //   ),
                              // );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(212, 56, 57, 1),
                                    border: Border.all(color: Colors.white38),
                                    borderRadius: BorderRadius.circular(15)),
                                // padding: EdgeInsets.only(left: 16),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/gold_logo.png",
              fit: BoxFit.contain,
              scale: 2,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              // alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 30),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "The Brand New",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                // TextAlign.center,
                "Cloths and Jewelery Selling app",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/gold_logo.png",
              fit: BoxFit.contain,
              scale: 2,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              // alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 30),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "The Brand New",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                // TextAlign.center,
                "Cloths and Jewelery Selling app",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/gold_logo.png",
              fit: BoxFit.contain,
              scale: 2,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              // alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 30),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "The Brand New",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                // TextAlign.center,
                "Cloths and Jewelery Selling app",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/men_bg.png",
              fit: BoxFit.contain,
              scale: 6,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              // alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 30),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "The Brand New",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                // TextAlign.center,
                "Trendy Men's ware",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/gold_logo.png",
              fit: BoxFit.contain,
              scale: 2,
            ),
            Container(
              padding: EdgeInsets.only(top: 80),
              // alignment: Alignment.center,
              // padding: EdgeInsets.only(top: 30),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "The Brand New",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                // TextAlign.center,
                "Cloths and Jewelery Selling app",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
