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

  List existedlist = [];
  bool _isprogress = true;
  @override
  initState() {
    super.initState();
    getWishdata().then((value) {
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
        // return existedlist;

        // print(existedlist.contains(widget.jsonfile["_id"]));

        // for (var item in existedlist) {
        //   existedwishitemids.add(item["_id"]);
        // }
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
                              print(existedlist);
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
                                  "${existedlist.length} Items",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  pricecount().toString(),
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

                  existedlist.length != 0
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: existedlist.length,
                              itemBuilder: (context, index) {
                                // print(existedlist[index]["name"]);
                                return Dismissible(
                                  key: Key('item ${existedlist[index]}'),
                                  onDismissed: (DismissDirection direction) {
                                    // if (direction ==
                                    //     DismissDirection.startToEnd) {
                                    //   print("Add to favorite");
                                    // } else {
                                    //   print('Remove item');
                                    // }
                                    setState(() {
                                      existedlist.remove(existedlist[index]);
                                    });
                                    Map<String, List> body = {
                                      "products": existedlist,
                                    };
                                    wishlistupdate(body).then((value) {
                                      print(value);
                                    });
                                  },
                                  child: WishListCard(
                                    name: existedlist[index]["name"],
                                    imgurl: existedlist[index]["url"],
                                    price: existedlist[index]["price"],
                                    onTapBag: () {
                                      setState(() {
                                        Cartwishlist.cartlist
                                            .add(Cartwishlist.wishlist[index]);
                                        Cartwishlist.wishlist.remove(
                                            Cartwishlist.wishlist[index]);
                                        print("wish ${Cartwishlist.wishlist}");
                                        print("cart  ${Cartwishlist.cartlist}");
                                      });
                                    },
                                    onTapDelete: () {
                                      setState(() {
                                        existedlist.remove(existedlist[index]);
                                      });
                                      Map<String, List> body = {
                                        "products": existedlist,
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
