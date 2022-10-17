// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class CartDetail extends StatefulWidget {
  final int? coffeeId;
  const CartDetail({Key? key, this.coffeeId}) : super(key: key);

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
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
          bottomNavigationBar: orderAddtoCart(),
        ),
      ),
    );
  }

  Widget orderDetailArea(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            height: 200,
            child: Row(
              children: [
                IconStepper(
                  enableNextPreviousButtons: false,
                  direction: Axis.vertical,
                  icons: const [
                    Icon(Icons.location_on),
                    Icon(Icons.local_fire_department),
                  ],
                  activeStep: 2,
                  onStepReached: (index) {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Text("Hotel Diamon Palace"),
                          Text("Hotel Diamon Palace"),
                        ],
                      ),
                      Column(
                        children: const [
                          Text("Middle Road Sediage"),
                          Text("Middle Road Sediage"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Stack(
          //   children: <Widget>[
          //     widget.coffeeId == 1
          //         ? Container(
          //             width: double.infinity / 2,
          //             height: MediaQuery.of(context).size.height / 2.5,
          //             child: Image.asset(
          //               fit: BoxFit.fill,
          //               "lib/assets/png/coffeeFull2.png",
          //             ))
          //         : Container(
          //             width: double.infinity / 2,
          //             height: MediaQuery.of(context).size.height / 2.5,
          //             child: Image.asset(
          //               fit: BoxFit.fill,
          //               "lib/assets/png/coffeeFull2.png",
          //             )),
          //     Positioned(
          //         top: 5.0,
          //         left: 5.0,
          //         child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(100.0)),
          //               gradient: LinearGradient(
          //                 colors: [Color.fromRGBO(255, 255, 255, 0.25), Color.fromRGBO(255, 255, 255, 0.25)],
          //                 begin: Alignment.bottomCenter,
          //                 end: Alignment.topCenter,
          //               ),
          //             ),
          //             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          //             child: InkWell(
          //               onTap: () {
          //                 Navigator.pop(context);
          //               },
          //               child: Icon(
          //                 Icons.arrow_back,
          //                 color: Colors.white,
          //               ),
          //             ))),
          //     Positioned(
          //         top: 5.0,
          //         right: 5.0,
          //         child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(100.0)),
          //               gradient: LinearGradient(
          //                 colors: [Color.fromRGBO(255, 255, 255, 0.25), Color.fromRGBO(255, 255, 255, 0.25)],
          //                 begin: Alignment.bottomCenter,
          //                 end: Alignment.topCenter,
          //               ),
          //             ),
          //             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          //             child: InkWell(
          //               onTap: () {},
          //               child: Icon(
          //                 Icons.favorite_outline,
          //                 color: Colors.white,
          //               ),
          //             ))),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget orderAddtoCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: MediaQuery.of(context).size.width / 3),
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
                "Pay Now",
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
                builder: (context) => CartDetail(
                  coffeeId: 1,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
