import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navaninew/market/coments-list.dart';
import 'package:navaninew/market/colors.dart';
import 'package:navaninew/market/icon-appbar.dart';
import 'package:navaninew/market/product-slider.dart';
import 'package:navaninew/market/button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:navaninew/constant/cartwishlistid.dart';
import 'package:navaninew/screens/cart.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  final id;
  final imagurl;
  final productname;
  final productDescrip;
  final price;
  final jsonfile;

  Product(
      {this.id,
      this.imagurl,
      this.price,
      this.productDescrip,
      this.jsonfile,
      this.productname});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isFaviroute = false;
  var existedwishitemids = [];
  @override
  initState() {
    super.initState();
    getWishdata().then((value) {
      if (value == "[]") {
        print("nothing");
      } else if (value != "[]") {
        List existedlist = json.decode(value)[0]["listofProductids"];
        // print(existedlist.contains(widget.jsonfile["_id"]));

        for (var item in existedlist) {
          existedwishitemids.add(item["_id"]);
        }
      }
      if (existedwishitemids.contains(widget.jsonfile["_id"])) {
        print("there");
        setState(() {
          isFaviroute = true;
        });
      } else {
        print("no there");
        setState(() {
          isFaviroute = false;
        });
      }
      // print(item["_id"] == widget.jsonfile["_id"]);
    });

    //   List existedlist = json.decode(value)[0]["listofProductids"];
    //   // print(existedlist);
    //   // if (existedlist.contains(widget.jsonfile)) {

    //   //   print("there");
    //   //   // setState(() {
    //   //   //   isFaviroute = true;
    //   //   // });
    //   // } else {
    //   //   print("not there");
    //   //   // setState(() {
    //   //   //   isFaviroute = false;
    //   //   // });
    //   // }
    // });

    // print(Cartwishlist.userid);
    // print(existedwishitemids);
  }
  //   @override
  // void initState() {
  //   super.initState();

  // }
  Future wishlistexists() async {
    var checkwish =
        "https://whispering-garden-19030.herokuapp.com/orders/checkuserinwishlist/${Cartwishlist.userid}";
    var response = await http.get(checkwish);
    return response.body;
  }

  //   Future regisTer(Map<String, String> body) async {
  //   var registerResponse = await http.post(urlRegister,
  //       headers: {"Content-type": "application/json"}, body: json.encode(body));
  //   var userId = json.decode(registerResponse.body)["_id"];
  //   print(userId);
  //   return userId;
  // }
  Future wishlistnew(Map<String, List> body) async {
    var newwish =
        "https://whispering-garden-19030.herokuapp.com/orders/wishliststore/${Cartwishlist.userid}";
    var response = await http.post(newwish,
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response.body;
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

  final sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final colors = ['Red', 'Blue', 'Green', 'Orange', 'White'];
  final productName = 'Blue Shirt';
  // bool isFaviroute;
  int sizeIndex = 0, colorIndex = 0;

  onClickShare() {
    // getlistofproductid(existedwishitemids);
    // getWishdata().then((value) {
    //   List existedlist = json.decode(value)[0]["listofProductids"];
    print(existedwishitemids);
    // });
    // wishlistexists().then((value) => (print(value)));
  }

  // List existedwishitemids = [];
  // getlistofproductid(list) {
  //   // existedwishitemids.clear();

  //   getWishdata().then((value) {
  //     if (value == "[]") {
  //       print("nothing");
  //     } else if (value != "[]") {
  //       List existedlist = json.decode(value)[0]["listofProductids"];

  //       for (var item in existedlist) {
  //         setState(() {
  //           existedwishitemids.add(item["_id"]);
  //         });
  //       }
  //       // return existedwishitemids;
  //     }

  //     // print(item["_id"] == widget.jsonfile["_id"]);
  //   });
  //   print(existedwishitemids);
  // }

  Widget filterSection(
      {@required title, @required value, @required onPressed}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productName,
              style: TextStyle(
                  color: ThemeColor.FILL,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0)),
          FlatButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: ThemeColor.FILL),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: Theme.of(context).textTheme.button),
                Icon(Icons.keyboard_arrow_down, size: 16.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: ThemeColor.BACKGROUND,
      appBar: iconAppBar(
        context: context,
        title: productName,
        onClick: onClickShare,
        rightIcon: Icons.share,
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
          child: PrimaryButton(
            text: 'ADD TO CART',
            onClick: () {
              // if (!Cartwishlist.cartlist.contains(widget.jsonfile)) {
              Cartwishlist.cartlist.add(widget.jsonfile);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
              // }
              //  else {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CartPage(),
              //     ),
              //
              // );
              // }
              print(Cartwishlist.cartlist);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Stack(children: [
                  // prodcuct slider
                  ProductSlider(
                    image: widget.imagurl,
                  ),
                  // like button
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: LikeButtonSimple(
                        isActive: isFaviroute,
                        onClick: () {
                          // wishlistnew(body)
                          setState(() {
                            isFaviroute = !isFaviroute;
                          });
                          wishlistexists().then((notexist) {
                            if (notexist == "true") {
                              Map<String, List> body = {
                                "products": [widget.jsonfile],
                              };
                              wishlistnew(body).then((value) {
                                print(value);
                              });
                            } else if (notexist == "false") {
                              if (existedwishitemids
                                  .contains(widget.jsonfile["_id"])) {
                                getWishdata().then((value) {
                                  List existedlist =
                                      json.decode(value)[0]["listofProductids"];
                                  for (var item in existedlist) {
                                    if (item["_id"] == widget.id) {
                                      existedlist.remove(item);
                                      setState(() {
                                        isFaviroute = false;
                                      });
                                      Map<String, List> body = {
                                        "products": existedlist,
                                      };
                                      wishlistupdate(body).then((value) {
                                        print(value);
                                      });
                                    } else {}
                                  }
                                });
                              } else {
                                getWishdata().then((value) {
                                  List existedlist =
                                      json.decode(value)[0]["listofProductids"];
                                  existedlist.add(widget.jsonfile);

                                  Map<String, List> body = {
                                    "products": existedlist,
                                  };
                                  wishlistupdate(body).then((value) {
                                    print(value);
                                  });
                                });
                              }
                              // print(existedwishitemids);
                              // print(existedwishitemids
                              //     .contains(widget.jsonfile["_id"]));
                              // getWishdata().then((value) {
                              //   // List existedlist =
                              //   //     json.decode(value)[0]["listofProductids"];

                              //   // print(widget.jsonfile);
                              // });
                              // getlistofproductid(existedwishitemids);
                              // print(existedwishitemids);
                            }
                          });

                          //
                          //
                          // }
                          // if (!Cartwishlist.wishlist
                          //     .contains(widget.jsonfile)) {
                          //   Cartwishlist.wishlist.add(widget.jsonfile);
                          //   Map<String, List> body = {
                          //     "products": Cartwishlist.wishlist,
                          //   };
                          //   wishlistexists().then((notexist) {
                          //     if (notexist == "true") {
                          //       wishlistnew(body).then((value) {
                          //         print(value);
                          //       });
                          //     } else if (notexist == "false") {
                          //       getWishdata().then((value) {
                          //         List existedlist =
                          //             json.decode(value)[0]["listofProductids"];
                          //         // print(existedlist);
                          //         Cartwishlist.wishlist.addAll(existedlist);
                          //         Map<String, List> body = {
                          //           "products": Cartwishlist.wishlist,
                          //         };
                          //         wishlistupdate(body).then((value) {
                          //           print(value);
                          //         });
                          //       });
                          //     }
                          //   });
                          // } else {
                          //   Cartwishlist.wishlist.remove(widget.jsonfile);
                          //   getWishdata().then((value) {
                          //     List existedlist =
                          //         json.decode(value)[0]["listofProductids"];
                          //     print(existedlist);
                          //     Cartwishlist.wishlist.addAll(existedlist);
                          //     Map<String, List> body = {
                          //       "products": Cartwishlist.wishlist,
                          //     };
                          //     wishlistupdate(body).then((value) {
                          //       print(value);
                          //     });
                          //   });
                          // }
                          // print(Cartwishlist.wishlist);

                          // print(body);
                        }),
                  ),
                ]),
              ]),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // filter items
                  SizedBox(height: 8.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        filterSection(
                            title: 'Size',
                            value: sizes[sizeIndex],
                            onPressed: () {
                              _openSize(context);
                            }), // (size)
                        SizedBox(width: 16.0),
                        filterSection(
                            title: 'Color',
                            value: colors[colorIndex],
                            onPressed: () {
                              _openColorFilter(context);
                            }), // (colour)
                        SizedBox(width: 5.0),
                      ]),

                  SizedBox(
                    height: 22.0,
                  ),

                  // details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // name
                      Text(
                        widget.productname,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 12.0, fontWeight: FontWeight.w900),
                      ),
                      // price
                      Text(
                        '\$' + '${widget.price}',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 10.0, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),

                  // sub heading
                  // Text(
                  //   'Short blue dress',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyText2
                  //       .copyWith(color: ThemeColor.FILL),
                  // ),

                  // star rating
                  SizedBox(
                    height: 5.0,
                  ),
                  RatingBar(
                    initialRating: 3,
                    itemSize: 15.0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: ThemeColor.FILL,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),

                  // star rating
                  SizedBox(height: 16.0),
                  Text(
                    widget.productDescrip,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: ThemeColor.FILL),
                  ),

                  SizedBox(height: 24.0),
                  Text(
                    'Ratings & Reviwes',
                    style: Theme.of(context).textTheme.headline4,
                  ),

                  SizedBox(height: 20.0),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('4.3',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(fontSize: 44.0)),
                            Text('23 ratings',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: ThemeColor.FILL)),
                          ],
                        ),
                        PrimaryIconsButtonSmall(
                          onClick: () {
                            Navigator.pushNamed(
                              context,
                              '/add-comment',
                              arguments: {},
                            );
                          },
                          text: 'Write a review',
                          icon: Icons.edit,
                        ),
                      ]),

                  SizedBox(height: 25.0),
                ]),
              ),
            ),

            CommentsList(),

            //
          ],
        )),
      ),
    );
  }

  void setColorFilter(index) {
    setState(() {
      colorIndex = index;
    });
    Navigator.pop(context);
  }

  void _openColorFilter(context) {
    List<Widget> items = List();
    for (int i = 0; i < colors.length; i++) {
      items.add(SimpleRectButton(
        onClick: () => setColorFilter(i),
        text: colors[i],
        isActive: (colorIndex == i),
      ));
    }
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            decoration: new BoxDecoration(
                color: ThemeColor.SECONDARY,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(26.0),
                  topRight: const Radius.circular(26.0),
                )),
            padding: EdgeInsetsDirectional.only(
                top: 36, start: 15.0, end: 15.0, bottom: 100.0),
            child: new Column(
              children: <Widget>[
                Center(
                  child: Text('Select Color',
                      style: Theme.of(context).textTheme.headline3),
                ),
                SizedBox(height: 22.0, width: double.infinity),
                Wrap(
                  spacing: 25.0,
                  children: items,
                )
              ],
            ),
          );
        });
  }

  // open review panel
  void setSizeFilter(index) {
    setState(() {
      sizeIndex = index;
    });
    Navigator.pop(context);
  }

  void _openSize(context) {
    List<Widget> items = List();
    for (int i = 0; i < sizes.length; i++) {
      items.add(SimpleRectButton(
        onClick: () => setSizeFilter(i),
        text: sizes[i],
        isActive: (sizeIndex == i),
      ));
    }
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            decoration: new BoxDecoration(
                color: ThemeColor.SECONDARY,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(26.0),
                  topRight: const Radius.circular(26.0),
                )),
            padding: EdgeInsetsDirectional.only(
                top: 36, start: 15.0, end: 15.0, bottom: 30.0),
            child: new Column(
              children: <Widget>[
                Center(
                  child: Text('Select Size',
                      style: Theme.of(context).textTheme.headline3),
                ),
                SizedBox(height: 22.0, width: double.infinity),
                Wrap(
                  spacing: 25.0,
                  children: items,
                )
              ],
            ),
          );
        });
  }
}
