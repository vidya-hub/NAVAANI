import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1583140250808-ae3414f8fea8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1547833604-dd82cc8805ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80',
    'https://images.unsplash.com/photo-1542834759-197152b49c42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1588099768531-a72d4a198538?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1586206079514-a79ad7a353b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              margin: EdgeInsets.only(left: 1.5, right: 1.5, bottom: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: FancyShimmerImage(
                  imageUrl: imgList[index],
                  boxFit: BoxFit.cover,
                  width: 200.0,
                ),
              ),
            );
          }),
    );
  }
}
