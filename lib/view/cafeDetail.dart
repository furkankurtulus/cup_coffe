// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cup_coffe/view/cartDetail.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CafeDetail extends StatefulWidget {
  const CafeDetail({Key? key}) : super(key: key);

  @override
  State<CafeDetail> createState() => _CafeDetailState();
}

class _CafeDetailState extends State<CafeDetail> {
  final _pageController = PageController(initialPage: 0);
  final controller = TextEditingController(text: "1");
  var cuurentPage = 0;
  int orderSize = 1;
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
          body: orderDetailArea(context),
        ),
      ),
    );
  }

  Widget orderDetailArea(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  width: double.infinity / 2,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset(
                    fit: BoxFit.fill,
                    "lib/assets/png/cafe1.png",
                  )),
              Positioned(
                  top: 5.0,
                  left: 5.0,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        gradient: LinearGradient(
                          colors: [Color.fromRGBO(255, 255, 255, 0.25), Color.fromRGBO(255, 255, 255, 0.25)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ))),
              Positioned(
                  top: 0.0,
                  right: MediaQuery.of(context).size.width / 3.5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    child: Text(
                      "Nearby shops",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
          Container(
            child: ListTile(
              title: Text(
                "Cappuccino",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "(\$ 550.00)",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              trailing: Container(
                width: 50,
                child: Row(children: [
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 218, 88, 1),
                  ),
                  Text(
                    "5.0",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextSpan(
                      text:
                          'Find the best place to hang out with friends. Visit Café Coffee Day and enjoy hot coffees, cold coffees, snacks and more. Asley is the best place to spend...',
                      style: GoogleFonts.poppins(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      )),
                  TextSpan(
                      text: 'Read more',
                      style: GoogleFonts.poppins(
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(255, 176, 103, 1),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      )),
                ],
              ),
            ),
          ),
          googleMap()
        ],
      ),
    );
  }

  Widget googleMap() {
    const LatLng source = LatLng(40.222462, 28.858865);
    return Container(
      height: 100,
      width: 100,
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
        target: source,
        zoom: 4,
      )),
    );
  }
}
