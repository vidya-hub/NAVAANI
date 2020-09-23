import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  final image;
  ProductSlider({this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      child: FancyShimmerImage(
        imageUrl: image,
        boxFit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
      ),
    ));
  }
}
