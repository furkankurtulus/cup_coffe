import 'package:cup_coffe/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 4),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                textAlign: TextAlign.center,
                "Order Confirmed",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              InkWell(
                child: Text(
                  textAlign: TextAlign.center,
                  "back to the home page",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(255, 176, 103, 1),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
