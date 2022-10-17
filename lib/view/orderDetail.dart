// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cup_coffe/view/cartDetail.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class OrderDetail extends StatefulWidget {
  final int? coffeeId;
  const OrderDetail({Key? key, this.coffeeId}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
          Stack(
            children: <Widget>[
              widget.coffeeId == 1
                  ? Container(
                      width: double.infinity / 2,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "lib/assets/png/coffeeFull2.png",
                      ))
                  : Container(
                      width: double.infinity / 2,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "lib/assets/png/coffeeFull2.png",
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
                  top: 5.0,
                  right: 5.0,
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
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ))),
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
                          'A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy..',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(255, 176, 103, 0.1), Color.fromRGBO(255, 176, 103, 0.1)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Image.asset(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  "lib/assets/png/coffeeBeans.png",
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(255, 176, 103, 0.1), Color.fromRGBO(255, 176, 103, 0.1)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Image.asset(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  "lib/assets/png/milk.png",
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(255, 176, 103, 0.1), Color.fromRGBO(255, 176, 103, 0.1)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Image.asset(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  "lib/assets/png/icon3.png",
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Choose size",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: orderSize == 1 ? Colors.white : Color.fromRGBO(49, 77, 69, 1), //                   <--- border color
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              colors: orderSize == 1 ? [Color.fromRGBO(49, 77, 69, 1), Color.fromRGBO(49, 77, 69, 1)] : [Colors.white, Colors.white],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            "100 ml",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: orderSize == 1 ? Colors.white : Color.fromRGBO(49, 77, 69, 1),
                            ),
                          )),
                      onTap: () {
                        setState(() {
                          orderSize = 1;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: orderSize == 2 ? Colors.white : Color.fromRGBO(49, 77, 69, 1), //                   <--- border color
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              colors: orderSize == 2 ? [Color.fromRGBO(49, 77, 69, 1), Color.fromRGBO(49, 77, 69, 1)] : [Colors.white, Colors.white],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            "250 ml",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: orderSize == 2 ? Colors.white : Color.fromRGBO(49, 77, 69, 1),
                            ),
                          )),
                      onTap: () {
                        setState(() {
                          orderSize = 2;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: orderSize == 3 ? Colors.white : Color.fromRGBO(49, 77, 69, 1), //                   <--- border color
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            gradient: LinearGradient(
                              colors: orderSize == 3 ? [Color.fromRGBO(49, 77, 69, 1), Color.fromRGBO(49, 77, 69, 1)] : [Colors.white, Colors.white],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            "500 ml",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: orderSize == 3 ? Colors.white : Color.fromRGBO(49, 77, 69, 1),
                            ),
                          )),
                      onTap: () {
                        setState(() {
                          orderSize = 3;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderAddtoCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(255, 176, 103, 0.1), Color.fromRGBO(255, 176, 103, 0.1)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      "-",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromRGBO(255, 176, 103, 1),
                      ),
                    )),
                onTap: () {
                  setState(() {
                    var value = int.parse(controller.text.toString()) - 1;
                    if (value <= 0) {
                      controller.text = "0";
                    } else {
                      controller.text = value.toString();
                    }
                  });
                },
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    enabled: false,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    controller: controller,
                  )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    gradient: LinearGradient(
                      colors: [Color.fromRGBO(255, 176, 103, 1), Color.fromRGBO(255, 176, 103, 1)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: InkWell(
                    child: Text(
                      "+",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        var value = int.parse(controller.text.toString()) + 1;
                        controller.text = value.toString();
                      });
                    },
                  )),
            ],
          ),
        ),
        InkWell(
          child: Container(
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
                "Add to cart",
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
