import 'package:flutter/material.dart';
import 'package:navaninew/market/product.dart';
import 'package:navaninew/resources/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CatalogItemOne extends StatelessWidget {
  final String imageURL;
  final bool isNew;
  final double marginOnRight;

  CatalogItemOne(
      {@required this.imageURL, this.isNew = false, this.marginOnRight = 13.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Product()));
      },
      child: Container(
        width: 164.0,
        margin: EdgeInsets.only(right: marginOnRight),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FancyShimmerImage(
                          imageUrl: imageURL,
                          boxFit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                        SizedBox(height: 6.0),

                        // rating bar
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
                        )
                      ],
                    ),
                    isNew
                        ? Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ThemeColor.BLACK,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Text('New',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ThemeColor.SECONDARY)),
                            ))
                        : Container(),
                    // Like button
                    Positioned(
                      right: 0.5,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Material(
                          elevation: 3.0,
                          shape: CircleBorder(),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.favorite_border,
                                  size: 20, color: ThemeColor.FILL)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),

                // Company name
                Text('Mango Boy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: ThemeColor.FILL)),

                SizedBox(height: 5.0),
                // Item name
                Text('T-Shirt Sailing',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600)),

                SizedBox(height: 3.0),
                // Item price
                Text('26\$', style: Theme.of(context).textTheme.button)
              ],
            )),
      ),
    );
  }
}
