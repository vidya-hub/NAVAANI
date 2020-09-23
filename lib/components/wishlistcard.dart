import 'package:flutter/material.dart';

class WishListCard extends StatelessWidget {
  var name = "name";
  final price;
  final imgurl;
  Function onTapDelete;
  Function onTapBag;
  WishListCard(
      {this.imgurl, this.name, this.price, this.onTapBag, this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Card(
        shadowColor: Colors.blueAccent[100],
        elevation: 10,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(imgurl),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        // color: Colors.black,
                        // decoration: BoxDecoration(
                        //   // color: Colors.cyan,
                        //   borderRadius: BorderRadius.circular(20),

                        //   border: Border.all(
                        //     color: Colors.pink[100],
                        //   ),
                        // ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                child: Text("$name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                child: Text("$price",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapDelete,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.delete),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.pink[100],
              ),
              GestureDetector(
                onTap: onTapBag,
                child: Text(
                  "ADD TO BAG",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
