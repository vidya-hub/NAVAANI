import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/components/cartpagecard.dart';
import 'package:navaninew/constant/cartwishlistid.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  pricecount() {
    int price = 0;
    for (var i = 0; i < existedlist.length; i++) {
      price = price + existedlist[i]["price"];
    }
    return price;
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  List existedlist = [];
  bool _isprogress = true;
  Future getCartdata() async {
    var getcart =
        "https://whispering-garden-19030.herokuapp.com/orders/getcartdatabyid/${Cartwishlist.userid}";
    var response = await http.get(getcart);
    return response.body;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartdata().then((value) {
      if (value == "[]") {
        print("nothing");
      } else if (value != "[]") {
        setState(() {
          existedlist = json.decode(value)[0]["listofProductids"];
        });
        Future.delayed(Duration(milliseconds: 20), () {
          setState(() {
            _isprogress = false;
          });
          print("there");
        });
      }
    });
    // print(Cartwishlist.userid);
  }

  Future cartupdate(Map<String, List> body) async {
    var url =
        "https://whispering-garden-19030.herokuapp.com/orders/updatecartdata/${Cartwishlist.userid}";
    var response = await http.patch(url,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isprogress,
        child: Container(
          // color: Theme.of(context).backgroundColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.08,
                      // ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Cart",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w300,
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "${existedlist.length} Items",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  "Rs ${pricecount().toString()}/-",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                existedlist.length != 0
                    ? Expanded(
                        child: Center(
                          child: ListView.builder(
                              itemCount: existedlist.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: ValueKey(existedlist[index]),
                                  // key: Key('item ${existedlist[index]}'),
                                  onDismissed: (DismissDirection direction) {
                                    setState(() {
                                      existedlist.remove(existedlist[index]);
                                    });
                                    Map<String, List> body = {
                                      "products": existedlist,
                                    };
                                    cartupdate(body).then((value) {
                                      print(value);
                                    });
                                    _showScaffold("Item Removed from Cart");
                                  },
                                  child: CartPageCard(
                                    name: existedlist[index]["name"],
                                    imgurl: existedlist[index]["url"],
                                    price: existedlist[index]["price"],
                                  ),
                                );
                              }),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: Text(
                            "Cart is Empty",
                            style: TextStyle(
                                // fontWeight: FontWeight.w300,
                                fontSize: 40.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    // shadowColor: ,
                    elevation: 10.0,
                    child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.11,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Total Price",
                                      style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Rs ${pricecount().toString()}/-",
                                      style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Container(
                                // padding: EdgeInsets.only(
                                //     top: 8.0, left: 70.0, right: 16.0, bottom: 0.0),
                                child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(8.0)),
                                  onPressed: () {},
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    "CHECKOUT",
                                    style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
