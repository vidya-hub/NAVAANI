import 'package:flutter/material.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/components/cartpagecard.dart';
import 'package:navaninew/constant/cartwishlistid.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  pricecount() {
    int price = 0;
    for (var i = 0; i < Cartwishlist.cartlist.length; i++) {
      price = price + Cartwishlist.cartlist[i]["price"];
    }
    return price;
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        // color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.14,
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
                                "${Cartwishlist.cartlist.length} Items",
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
              Expanded(
                child: Center(
                  child: ListView.builder(
                      itemCount: Cartwishlist.cartlist.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key('item ${Cartwishlist.cartlist[index]}'),
                          onDismissed: (DismissDirection direction) {
                            if (direction == DismissDirection.startToEnd) {
                              print("Add to favorite");
                            } else {
                              print('Remove item');
                            }
                            setState(() {
                              Cartwishlist.wishlist
                                  .remove(Cartwishlist.wishlist[index]);

                              _showScaffold("Item Removed from Cart");
                            });
                          },
                          child: CartPageCard(
                            name: Cartwishlist.cartlist[index]["name"],
                            imgurl: Cartwishlist.cartlist[index]["url"],
                            price: Cartwishlist.cartlist[index]["price"]
                                .toString(),
                          ),
                        );
                      }),
                ),
              ),
              Material(
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
                                  borderRadius: new BorderRadius.circular(8.0)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
