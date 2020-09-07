import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

final List<String> imgList = [
  'https://cdn01.buxtonco.com/news/1999/istock-506442302__large.jpg',
  // 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1445205170230-053b83016050?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
  
  
  // 'https://images.pexels.com/photos/177332/pexels-photo-177332.jpeg?cs=srgb&dl=pexels-scott-webb-177332.jpg&fm=jpg',
  'https://images.pexels.com/photos/445986/pexels-photo-445986.jpeg?cs=srgb&dl=pexels-ana-paula-lima-445986.jpg&fm=jpg',
  'https://images.pexels.com/photos/2899839/pexels-photo-2899839.jpeg?cs=srgb&dl=pexels-dima-valkov-2899839.jpg&fm=jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: FancyShimmerImage(
                  imageUrl: item,
                  boxFit: BoxFit.cover,
                  width: 1000.0,
                )),
          ),
        ))
    .toList();
