// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cup_coffe/view/cafeDetail.dart';
import 'package:cup_coffe/view/orderDetail.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  var cuurentPage = 0;
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
          body: PageView(
            controller: _pageController,
            children: [
              homePageArea(context),
            ],
          ),
          bottomNavigationBar: BottomBar(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            selectedIndex: cuurentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => cuurentPage = index);
            },
            items: const <BottomBarItem>[
              BottomBarItem(
                icon: Icon(Icons.home),
                activeColor: Colors.black,
              ),
              BottomBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeColor: Colors.black,
              ),
              BottomBarItem(
                icon: Icon(Icons.format_list_bulleted),
                activeColor: Colors.black,
              ),
              BottomBarItem(
                icon: Icon(Icons.preview),
                activeColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homePageArea(context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width / 25,
        left: MediaQuery.of(context).size.width / 13,
        right: MediaQuery.of(context).size.width / 13,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            appBarSide,
            searchBar,
            popularCoffees,
            neerestCoffeeShops,
          ],
        ),
      ),
    );
  }

  Widget get appBarSide => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                        text: 'Get Your',
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        )),
                    TextSpan(
                        text: ' Coffee ',
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.none,
                          color: Color.fromRGBO(255, 176, 103, 1),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        )),
                    TextSpan(
                        text: 'on one finger tap',
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              child: ClipOval(
                child: Image.asset(
                  width: 250,
                  height: 100,
                  fit: BoxFit.cover,
                  "lib/assets/png/cricleAvatar.png",
                ),
              ),
            )
          ],
        ),
      );

  Widget get searchBar => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Container(
            child: TextField(
          decoration: InputDecoration(
              fillColor: Color.fromRGBO(205, 205, 205, 0.25),
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(157, 157, 157, 1),
              ),
              hintText: 'Search anything',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(205, 205, 205, 0.25),
                ),
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(205, 205, 205, 0.25),
                ),
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(205, 205, 205, 0.25),
                  ))),
        )),
      );

  Widget get popularCoffees => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Popular Coffee",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              )
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              padEnds: false,
              height: MediaQuery.of(context).size.height / 2.8,
              enlargeCenterPage: false,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
            ),
            items: [coffeeFirst, coffeSecond],
          ),
        ]),
      );

  Widget get neerestCoffeeShops => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Neearest coffee shops",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              )
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              padEnds: false,
              height: MediaQuery.of(context).size.height / 2.8,
              enlargeCenterPage: false,
              viewportFraction: 0.6,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
            ),
            items: [cafeFirst, cafeFirst],
          ),
        ]),
      );

  Widget get coffeeFirst => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: InkWell(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetail(
                          coffeeId: 1,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/png/coffee1.png",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 4.2,
                        width: MediaQuery.of(context).size.width / 1.5,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 10 min delivery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 218, 88, 1),
                                  ),
                                  Text(
                                    ' 3.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ListTile(
                        title: Text(
                          "Chocolate Coffee",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          "\$ 550.00",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              "Bunny cafe",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );

  Widget get coffeSecond => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: InkWell(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetail(
                          coffeeId: 2,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/png/coffee2.png",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 4.2,
                        width: MediaQuery.of(context).size.width / 1.5,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 7 min delivery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(255, 218, 88, 1),
                                  ),
                                  Text(
                                    ' 5.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ListTile(
                        title: Text(
                          "Cappuccino",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          "\$ 550.00",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              "Coffee cafe",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );

  Widget get cafeFirst => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25),
        child: Column(
          children: [
            InkWell(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "lib/assets/png/cafe1.png",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.2,
                      ),
                      Positioned(
                        top: 0.0,
                        right: -10.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(255, 255, 255, 0.25), Color.fromARGB(40, 255, 255, 255)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '1.5 km',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CafeDetail(),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: ListTile(
                        title: Text(
                          "Asley coffee",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 218, 88, 1),
                            ),
                            Text(
                              "5.0/105 rating",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
}
