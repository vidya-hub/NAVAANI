import 'package:flutter/material.dart';
import 'package:navaninew/market/coments-list.dart';
import 'package:navaninew/market/colors.dart';
import 'package:navaninew/market/icon-appbar.dart';
import 'package:navaninew/market/product-slider.dart';
import 'package:navaninew/market/button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:navaninew/constant/cartwishlistid.dart';
import 'package:navaninew/screens/cart.dart';

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
  @override
  void initState() {
    super.initState();
    if (Cartwishlist.wishlist.contains(widget.jsonfile)) {
      setState(() {
        isFaviroute = true;
      });
    } else {
      setState(() {
        isFaviroute = false;
      });
    }
  }

  final sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final colors = ['Red', 'Blue', 'Green', 'Orange', 'White'];
  final productName = 'Blue Shirt';
  bool isFaviroute;
  int sizeIndex = 0, colorIndex = 0;

  void onClickShare() {
    // complete here
  }

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
                          setState(() {
                            isFaviroute = !isFaviroute;
                          });
                          if (!Cartwishlist.wishlist
                                  .contains(widget.jsonfile) &&
                              isFaviroute) {
                            Cartwishlist.wishlist.add(widget.jsonfile);
                          } else {
                            Cartwishlist.wishlist.remove(widget.jsonfile);
                          }
                          print(Cartwishlist.wishlist);
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
