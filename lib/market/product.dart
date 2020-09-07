import 'package:flutter/material.dart';
import 'package:navaninew/market/coments-list.dart';
import 'package:navaninew/market/colors.dart';
import 'package:navaninew/market/icon-appbar.dart';
import 'package:navaninew/market/product-slider.dart';
import 'package:navaninew/market/button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final colors = ['Red', 'Blue', 'Green', 'Orange', 'White'];
  final productName = 'Blue Shirt';
  bool isFaviroute = false;
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
          Text(title,
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
          child: PrimaryButton(text: 'ADD TO CART', onClick: () {}),
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
                  ProductSlider(),
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
                        'H&M',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 24.0),
                      ),
                      // price
                      Text(
                        '\$' + '19.22',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 24.0),
                      )
                    ],
                  ),

                  // sub heading
                  Text(
                    'Short blue dress',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: ThemeColor.FILL),
                  ),

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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna' +
                        'aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ' +
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
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
