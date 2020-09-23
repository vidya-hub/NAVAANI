import 'package:flutter/material.dart';

class CartPageCard extends StatelessWidget {
  var name;
  final price;
  final imgurl;
  CartPageCard({this.imgurl, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        shadowColor: Colors.blueAccent[100],
        elevation: 10,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 135,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(imgurl),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Center(
                              child: Text("$name",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: Text("$price",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // width: 60,
                          // height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                width: 0.2, color: Colors.red.shade100),
                          ),
                          child: new InkWell(
                            child: Icon(
                              Icons.add,
                              color: Colors.black54,
                              size: 30,
                            ),
                            onTap: () {
                              // widget.currentValue = val1;
                              // setState(() {
                              //   widget.currentValue--;
                              //   val1 = (widget.currentValue >= 0
                              //       ? widget.currentValue
                              //       : 0);
                              // });
                            },
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(right: 15)),
                        new Text(
                          "1",
                          style: TextStyle(fontSize: 25),
                        ),
                        // Padding(padding: EdgeInsets.only(left: 15)),
                        Container(
                          // width: 35,
                          // height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                width: 0.02, color: Colors.lime[700]),
                          ),
                          child: new InkWell(
                            child: Icon(
                              Icons.remove,
                              color: Colors.black54,
                              size: 30,
                            ),
                            onTap: () {
                              // widget.currentValue = val1;
                              // setState(() {
                              //   widget.currentValue++;
                              //   val1 = (widget.currentValue >= 0
                              //       ? widget.currentValue
                              //       : 0);
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
