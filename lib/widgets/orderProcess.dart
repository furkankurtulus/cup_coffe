// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cup_coffe/widgets/orderConfirmed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/order.dart';
import '../service/firevbase_service.dart';
import '../viewmodel/order_viewmodel.dart';

class OrderProcess extends StatefulWidget {
  final Order? model;
  const OrderProcess({super.key, this.model});

  @override
  State<OrderProcess> createState() => _OrderProcessState();
}

class _OrderProcessState extends State<OrderProcess> {
  late final OrderViewModel _orderViewModel;

  void initState() {
    _orderViewModel = OrderViewModel(FirebaseService());
    super.initState();
    // getConnectData();

    Timer(Duration(seconds: 2), () async {
      createOrder();
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          fit: BoxFit.cover,
          "lib/assets/png/processing.png",
        ),
        Text(
          "Your order is processing",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ]),
    );
  }

  void createOrder() async {
    var model = new Order();
    model.coffeId = widget.model?.coffeId;
    model.coffeCount = widget.model?.coffeCount;
    model.coffeSize = widget.model?.coffeSize;
    var result = await _orderViewModel.createOrder(model);
    if (result) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirm(),
        ),
      );
    }
  }
}
