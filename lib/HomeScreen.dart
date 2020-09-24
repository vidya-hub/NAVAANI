import 'package:flutter/material.dart';
import 'package:navaninew/DrawerScreen.dart';
import 'package:navaninew/market/product.dart';
import 'package:navaninew/profile_page.dart';
import 'package:navaninew/components/catlog-items.dart';
import 'package:navaninew/components/imgslider.dart';
import 'package:navaninew/resources/color.dart';
import 'package:navaninew/screens/cart.dart';
import 'package:navaninew/screens/wishlist.dart';
import 'package:navaninew/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  final userId;

  HomeScreen({this.userId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // double xOffset = 0.0;
  // double yOffset = 0.0;
  // double scaleFactor = 1;
  // bool isDrawerOpen = false;
  List collectionData = [
    {
      'imgURL':
          'https://i.pinimg.com/736x/c4/b3/4b/c4b34b8639a99ef0787411811b8e82c1.jpg',
      'isNew': true
    },
    {
      'imgURL':
          'https://cdn01.buxtonco.com/news/1999/istock-506442302__large.jpg',
      'isNew': false
    },
    {
      'imgURL':
          'https://i.pinimg.com/736x/c4/b3/4b/c4b34b8639a99ef0787411811b8e82c1.jpg',
      'isNew': true
    },
    {
      'imgURL':
          'https://cdn01.buxtonco.com/news/1999/istock-506442302__large.jpg',
      'isNew': false
    },
    {
      'imgURL':
          'https://i.pinimg.com/736x/c4/b3/4b/c4b34b8639a99ef0787411811b8e82c1.jpg',
      'isNew': true
    },
    {
      'imgURL':
          'https://cdn01.buxtonco.com/news/1999/istock-506442302__large.jpg',
      'isNew': false
    }
  ];
  List jewelsdata = [
    {
      'imgURL':
          'https://images.pexels.com/photos/177332/pexels-photo-177332.jpeg?cs=srgb&dl=pexels-scott-webb-177332.jpg&fm=jpg',
    },
    {
      'imgURL':
          'https://images.pexels.com/photos/3641056/pexels-photo-3641056.jpeg?cs=srgb&dl=pexels-castorly-stock-3641056.jpg&fm=jpg',
    },
    {
      'imgURL':
          'https://images.pexels.com/photos/445986/pexels-photo-445986.jpeg?cs=srgb&dl=pexels-ana-paula-lima-445986.jpg&fm=jpg',
    },
    {
      'imgURL':
          'https://images.pexels.com/photos/2735970/pexels-photo-2735970.jpeg?cs=srgb&dl=pexels-say-straight-2735970.jpg&fm=jpg',
    },
    {
      'imgURL':
          'https://images.pexels.com/photos/3266703/pexels-photo-3266703.jpeg?cs=srgb&dl=pexels-dima-valkov-3266703.jpg&fm=jpg',
    },
    {
      'imgURL':
          'https://images.pexels.com/photos/2899839/pexels-photo-2899839.jpeg?cs=srgb&dl=pexels-dima-valkov-2899839.jpg&fm=jpg',
    }
  ];
  String productsUrl =
      "https://whispering-garden-19030.herokuapp.com/products/allproducts";
  List catIconCollection = [
    'icons/dress.png',
    'icons/tshirt.png',
    'icons/men2.png',
    'icons/boy.png',
    'icons/jacket.png',
    'icons/necklace.png',
    'icons/ring.png',
    'icons/earrings.png'
  ];
  bool isFaviroute = false;
  List menUrls = [];
  List girlUrls = [];
  List kidboyUrls = [];
  List kidGirlUrls = [];

  getRefresh() {
    return null;
  }

  Container getHomeScreenList() {
    return Container(
      child: Column(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            }),
                        Container(
                          child: Image.asset(
                            "images/title-bg.png",
                            scale: 4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            }),
                        IconButton(
                            icon: Icon(Icons.shopping_basket),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ),
                              );
                            }),
                        IconButton(
                            icon: Icon(Icons.card_giftcard),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WishList(),
                                ),
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  print("tap");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Shop(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(1, 3),
                      ),
                    ],

                    // border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, size: 20, color: Colors.black54),
                            Text(
                              'Search Here',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                offset: Offset.zero)
                          ],
                          color: Colors.black45,

                          // border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        // color: Colors.blue,
                        child: Icon(
                          Icons.business_center,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,

                  // color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              catIconCollection[index],
                            ),
                          ),
                          radius: 35.0,
                        ),
                      );
                    },
                    itemCount: 8,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 1.0,
          ),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('New Mens Collection',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 4.0),
                  // Spacer(),
                  Text('Celebration Collection',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .apply(color: ThemeColor.FILL)),
                ]),
                // Spacer(),
                GestureDetector(
                    child: Text('View All',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold)),
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: menUrls.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CatalogItemOne(
                        onTapmethod: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Product(
                                id: menUrls[index]["_id"],
                                imagurl: menUrls[index]["url"],
                                price: menUrls[index]["price"].toString(),
                                productDescrip: menUrls[index]['Description'],
                                productname: menUrls[index]['name'],
                                jsonfile: menUrls[index],
                              ),
                            ),
                          );
                        },
                        imageURL: menUrls[index]["url"],
                        isNew: menUrls[index]['type'],
                        name: menUrls[index]['name'],
                        price: menUrls[index]['price'].toString(),
                        desCription: menUrls[index]['Description'],
                        // onTapLove: () {
                        //   setState(() {
                        //     isFaviroute = !isFaviroute;
                        //   });
                        // },
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Girls Collection',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 4.0),
                    // Spacer(),
                    Text('Olg gauge Collection',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .apply(color: ThemeColor.FILL)),
                  ],
                ),
                // Spacer(),
                GestureDetector(
                    child: Text('View All',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold)),
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            // padding: EdgeInsets.only(
            //     left: MediaQuery.of(context).size.width * 0.09),
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: girlUrls.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CatalogItemOne(
                        onTapmethod: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Product(
                                  id: girlUrls[index]["_id"],
                                  imagurl: girlUrls[index]["url"],
                                  //  imagurl: menUrls[index]["url"],
                                  price: girlUrls[index]["price"].toString(),
                                  productDescrip: menUrls[index]['Description'],
                                  productname: girlUrls[index]['name'],
                                  jsonfile: girlUrls[index]),
                            ),
                          );
                        },
                        imageURL: girlUrls[index]["url"],
                        isNew: girlUrls[index]['type'],
                        name: girlUrls[index]['name'],
                        price: girlUrls[index]['price'].toString(),
                        desCription: girlUrls[index]['Description'],
                        // onTapLove: () {
                        //   setState(() {
                        //     isFaviroute = !isFaviroute;
                        //   });
                        // },
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Kids Collection',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(height: 4.0),
                    // Spacer(),
                    Text('Olg gauge Collection',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .apply(color: ThemeColor.FILL)),
                  ],
                ),
                // Spacer(),
                GestureDetector(
                    child: Text('View All',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold)),
                    onTap: () {})
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            // padding: EdgeInsets.only(
            //     left: MediaQuery.of(context).size.width * 0.09),
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: kidboyUrls.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CatalogItemOne(
                        onTapmethod: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Product(
                                id: kidboyUrls[index]["_id"],
                                imagurl: kidboyUrls[index]["url"],
                                price: kidboyUrls[index]["price"].toString(),
                                productDescrip: kidboyUrls[index]
                                    ['Description'],
                                productname: kidboyUrls[index]['name'],
                                jsonfile: kidboyUrls[index],
                              ),
                            ),
                          );
                        },
                        imageURL: kidboyUrls[index]["url"],
                        isNew: kidboyUrls[index]['type'],
                        name: kidboyUrls[index]['name'],
                        price: kidboyUrls[index]['price'].toString(),
                        desCription: kidboyUrls[index]['Description'],
                        // onTapLove: () {
                        //   setState(() {
                        //     isFaviroute = !isFaviroute;
                        //   });
                        // },
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getProducts(productsUrl);
    getProducts(productsUrl).then(
      (value) async {
        var data = await json.decode(value.body);
        for (var item in data) {
          if (item["type"] == "MenCloth") {
            setState(() {
              menUrls.add(item);
            });
          } else if (item["type"] == "GirlCloth") {
            setState(() {
              girlUrls.add(item);
            });
          } else if (item["type"] == "KidBoys") {
            setState(() {
              kidboyUrls.add(item);
            });
          } else if (item["type"] == "KidGirl") {
            setState(() {
              kidGirlUrls.add(item);
            });
          }
        }
        // print(data);
        // print(menUrls.length);
      },
    );
    // print(widget.userId);
  }

  Future getProducts(String url) async {
    var response = await http.get(url);

    // print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: RefreshIndicator(
        onRefresh: () => getRefresh(),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: getHomeScreenList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
