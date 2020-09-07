import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  const MenuItem({this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              // backgroundColor: Colors.white,
              radius: MediaQuery.of(context).size.width * 0.045,
              child: Icon(
                icon,
                size: 22,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                // color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
