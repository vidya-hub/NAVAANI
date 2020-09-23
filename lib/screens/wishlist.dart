import 'package:flutter/material.dart';
import 'package:navaninew/HomeScreen.dart';
import 'package:navaninew/components/wishlistcard.dart';
import 'package:navaninew/constant/cartwishlistid.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  pricecount() {
    int price = 0;
    for (var i = 0; i < Cartwishlist.wishlist.length; i++) {
      price = price + Cartwishlist.wishlist[i]["price"];
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                "${Cartwishlist.wishlist.length} Items",
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

                Expanded(
                  child: ListView.builder(
                      itemCount: Cartwishlist.wishlist.length,
                      itemBuilder: (context, index) {
                        return WishListCard(
                          name: Cartwishlist.wishlist[index]["name"],
                          imgurl: Cartwishlist.wishlist[index]["url"],
                          price: Cartwishlist.wishlist[index]["price"],
                          onTapBag: () {
                            setState(() {
                              Cartwishlist.cartlist
                                  .add(Cartwishlist.wishlist[index]);
                              Cartwishlist.wishlist
                                  .remove(Cartwishlist.wishlist[index]);
                              print("wish ${Cartwishlist.wishlist}");
                              print("cart  ${Cartwishlist.cartlist}");
                            });
                          },
                          onTapDelete: () {
                            setState(() {
                              Cartwishlist.wishlist
                                  .remove(Cartwishlist.wishlist[index]);
                            });

                            print(Cartwishlist.wishlist);
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
