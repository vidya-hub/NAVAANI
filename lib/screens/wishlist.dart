import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/components/wishlistcard.dart';
import 'package:navaninew/constant/cartwishlistid.dart';
import 'package:http/http.dart' as http;

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  pricecount() {
    int price = 0;
    for (var i = 0; i < existedwishlist.length; i++) {
      price = price + existedwishlist[i]["price"];
    }
    return price;
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future getWishdata() async {
    var getwish =
        "https://whispering-garden-19030.herokuapp.com/orders/getwishlistdatabyid/${Cartwishlist.userid}";
    var response = await http.get(getwish);
    return response.body;
  }

  Future wishlistupdate(Map<String, List> body) async {
    var newwish =
        "https://whispering-garden-19030.herokuapp.com/orders/updatewishlistdata/${Cartwishlist.userid}";
    var response = await http.patch(newwish,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response.body;
  }

  Future createNewCart(Map<String, List> body) async {
    String url =
        "https://whispering-garden-19030.herokuapp.com/orders/cartstore/${Cartwishlist.userid}";
    var response = await http.post(url,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response.body;
  }

  Future cartexists() async {
    var checkcart =
        "https://whispering-garden-19030.herokuapp.com/orders/checkuserincart/${Cartwishlist.userid}";
    var response = await http.get(checkcart);
    return response.body;
  }

  Future cartupdate(Map<String, List> body) async {
    var url =
        "https://whispering-garden-19030.herokuapp.com/orders/updatecartdata/${Cartwishlist.userid}";
    var response = await http.patch(url,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response.body;
  }

  Future getCartdata() async {
    var getcart =
        "https://whispering-garden-19030.herokuapp.com/orders/getcartdatabyid/${Cartwishlist.userid}";
    var response = await http.get(getcart);
    return response.body;
  }

  List existedwishlist = [];
  bool _isprogress = true;
  @override
  initState() {
    super.initState();
    getWishdata().then((value) {
      if (value == "[]") {
        print("nothing");
      } else if (value != "[]") {
        setState(() {
          existedwishlist = json.decode(value)[0]["listofProductids"];
          print(existedwishlist.length);
        });
        Future.delayed(Duration(milliseconds: 20), () {
          setState(() {
            _isprogress = false;
          });
          print("there");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: _isprogress,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              print(existedwishlist);
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
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Wishlist",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w300,
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "${existedwishlist.length} Items",
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
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  // for (var i = 0; i < collectionData.length; i++)

                  existedwishlist.length != 0
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: existedwishlist.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: ValueKey(existedwishlist[index]),
                                  onDismissed: (DismissDirection direction) {
                                    setState(() {
                                      existedwishlist
                                          .remove(existedwishlist[index]);
                                    });
                                    Map<String, List> body = {
                                      "products": existedwishlist,
                                    };
                                    wishlistupdate(body).then((value) {
                                      print(value);
                                    });
                                  },
                                  child: WishListCard(
                                    name: existedwishlist[index]["name"],
                                    imgurl: existedwishlist[index]["url"],
                                    price: existedwishlist[index]["price"],
                                    onTapBag: () {
                                      getCartdata().then((value) async {
                                        List existedcartlist =
                                            json.decode(value)[0]
                                                ["listofProductids"];
                                        print(existedcartlist.length);

                                        setState(() {
                                          existedcartlist
                                              .add(existedwishlist[index]);
                                        });
                                        print(existedcartlist.length);

                                        Map<String, List> body = {
                                          "products": existedcartlist,
                                        };
                                        cartupdate(body).then((value) {
                                          print(value);
                                        });
                                      });
                                      getWishdata().then((value) {
                                        List existedlist = json.decode(value)[0]
                                            ["listofProductids"];
                                        // for (var item in existedlist)
                                        print(existedlist.length);

                                        setState(() {
                                          // print();
                                          // existedlist.removeWhere((element) =>
                                          //     element["_id"] ==
                                          //     existedwishlist[index]["_id"]);
                                          existedwishlist.removeWhere(
                                              (element) =>
                                                  element["_id"] ==
                                                  existedwishlist[index]
                                                      ["_id"]);
                                        });
                                        Map<String, List> body = {
                                          "products": existedwishlist,
                                        };
                                        wishlistupdate(body).then((value) {
                                          print(value);
                                        });
                                      });
                                      //  print(existedwishlist.length);
                                      // setState(() {
                                      // print();
                                      //   existedwishlist.removeWhere(
                                      //       (element) =>
                                      //           element["_id"] ==
                                      //           existedwishlist[index]);
                                      // });
                                      // print(existedwishlist.length);
                                      // setState(() {
                                      //   existedwishlist
                                      //       .remove(existedwishlist[index]);
                                      // });
                                      // Map<String, List> body = {
                                      //   "products": existedwishlist,
                                      // };
                                      // wishlistupdate(body).then((value) {
                                      //   print(value);
                                      // });
                                    },
                                    onTapDelete: () {
                                      setState(() {
                                        existedwishlist
                                            .remove(existedwishlist[index]);
                                      });
                                      Map<String, List> body = {
                                        "products": existedwishlist,
                                      };
                                      wishlistupdate(body).then((value) {
                                        print(value);
                                      });
                                      // print(Cartwishlist.wishlist);
                                    },
                                  ),
                                );
                              }),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Text(
                              "WishList is Empty",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w300,
                                  fontSize: 40.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
