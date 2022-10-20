// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cup_coffe/model/order.dart';
import 'package:cup_coffe/service/firevbase_service.dart';
import 'package:cup_coffe/viewmodel/order_viewmodel.dart';
import 'package:cup_coffe/widgets/orderConfirmed.dart';
import 'package:cup_coffe/widgets/orderProcess.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class CartDetail extends StatefulWidget {
  final int? coffeeId;
  final int? coffeeSize;
  final int? coffeeCount;
  const CartDetail({
    Key? key,
    this.coffeeId,
    this.coffeeSize,
    this.coffeeCount,
  }) : super(key: key);

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  late final OrderViewModel _orderViewModel;
  final _pageController = PageController(initialPage: 0);
  final controller = TextEditingController();
  var cuurentPage = 0;
  int orderSize = 1;
  @override
  @override
  void initState() {
    _orderViewModel = OrderViewModel(FirebaseService());
    controller.text = widget.coffeeCount.toString();
    super.initState();
  }

  CartDetail() {}

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
    return Column(
      children: [
        pageHeader(),
        orderTrack(),
        orderCard(),
        orderSummary(),
      ],
    );
  }

  Widget pageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        Text(
          "Place Order",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        )
      ],
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
          onTap: () async {
            OrderConfirm();
            var model = new Order();
            model.coffeId = widget.coffeeId;
            model.coffeCount = widget.coffeeCount;
            model.coffeSize = widget.coffeeSize;
            // await _orderViewModel.createOrder(model);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderProcess(model: model),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget orderCard() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            gradient: LinearGradient(
              colors: const [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    child: Image.asset(
                  fit: BoxFit.fill,
                  "lib/assets/png/coffee2.png",
                )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          "Hotel Diamon Palace",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "H201, sector 25, Centre Park, New Delhi, India",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              coffeeOrderCountArea,
            ],
          )),
    );
  }

  Widget orderTrack() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              children: [
                IconStepper(
                  lineColor: Color.fromRGBO(255, 176, 103, 1),
                  activeStepColor: Colors.white,
                  stepColor: Colors.white,
                  enableNextPreviousButtons: false,
                  direction: Axis.vertical,
                  icons: const [
                    Icon(
                      Icons.location_on,
                      color: Color.fromRGBO(255, 176, 103, 1),
                    ),
                    Icon(
                      Icons.local_fire_department,
                      color: Color.fromRGBO(255, 176, 103, 1),
                    ),
                  ],
                  activeStep: 2,
                  onStepReached: (index) {},
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  textAlign: TextAlign.left,
                                  "Hotel Diamon Palace",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
                                  child: Container(
                                      child: Image.asset(
                                    fit: BoxFit.fill,
                                    "lib/assets/png/edit-3.png",
                                  )),
                                ),
                              ],
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              "H394K, Central Park, New Delhi, India",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.left,
                              "Middle road Sediago",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              "H201, sector 25, Centre Park, New Delhi, India",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey,
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
          ),
        ],
      ),
    );
  }

  Widget orderSummary() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              gradient: LinearGradient(
                colors: const [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            height: MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "01",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _customDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ 550.00",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _customDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ 90.00",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _customDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "\$ 50",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _customDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$ 510.00",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return SizedBox(
      height: 10.0,
      child: Center(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 1.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget get coffeeOrderCountArea => Expanded(
        flex: 2,
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
      );
}
