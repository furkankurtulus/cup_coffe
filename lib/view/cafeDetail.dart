// ignore_for_file: prefer_const_constructors

import 'package:flutter_map/flutter_map.dart';
import 'package:cup_coffe/view/cafeProducts.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart' as latLng;

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
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
        body: orderDetailArea(context),
      ),
    );
  }

  Widget orderDetailArea(context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          cafeHeader(),
          cafeDescription(),
          location(),
          viewProducts(),
        ],
      ),
    );
  }

  Widget cafeHeader() {
    return Stack(
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
    );
  }

  Widget cafeDescription() {
    return Column(
      children: [
        Container(
          child: ListTile(
            title: Text(
              overflow: TextOverflow.ellipsis,
              "Ashel Cafe",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  "Special coffee and cakes",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            trailing: Container(
              width: MediaQuery.of(context).size.width / 2.9,
              child: Row(children: [
                Icon(
                  Icons.star,
                  color: Color.fromRGBO(255, 218, 88, 1),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "5.0/ 105  ratings",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color.fromRGBO(157, 157, 157, 1),
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
      ],
    );
  }

  Widget location() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(51.509364, -0.128928),
          zoom: 9.2,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
        ],
      ),
    );
  }

  Widget viewProducts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(49, 77, 69, 1), Color.fromRGBO(49, 77, 69, 1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                "View products",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CafeProducts(),
              ),
            );
          },
        ),
      ],
    );
  }
}
