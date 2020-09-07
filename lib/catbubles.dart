import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  final imgpath;
  final String title;
  final Function onTap;
  const CatItem({this.imgpath, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              imgpath,
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                // fontWeight: FontWeight.w300,
                fontSize: 18.0,
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
