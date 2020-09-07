import 'package:flutter/material.dart';

import '../configuration.dart';
// import '../screen2.dart';

class TilesHomepage extends StatelessWidget {
  var imagPath;
  var name;
  var price;
  Color color;
  TilesHomepage({
    this.color,
    this.imagPath,
    this.name,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Screen2()));
      // },
      child: Container(
        height: 240,
        // width: 240,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: shadowList,
                  ),
                  margin: EdgeInsets.only(top: 50.0),
                ),
                Align(
                  child: Hero(
                    child: Image.asset(imagPath),
                    tag: 1,
                  ),
                ),
              ],
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    // IconButton(icon: Icon(Icons.vpn_key), onPressed: null),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 20),
                    ),

                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
