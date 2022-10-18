import 'dart:async';
import 'package:cup_coffe/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isInternetOn = true;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String username = "";
  @override
  void initState() {
    super.initState();
    // getConnectData();

    Timer(Duration(seconds: 5), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              fit: BoxFit.fill,
              "lib/assets/png/splashScreen.png",
            )),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                      text: 'Cup',
                      style: TextStyle(
                          fontFamily: 'ComicSansMS', fontSize: 50, decoration: TextDecoration.none, color: Color.fromRGBO(255, 255, 255, 1))),
                  TextSpan(
                      text: ' Coffee',
                      style: TextStyle(
                          fontFamily: 'ComicSansMS', fontSize: 50, decoration: TextDecoration.none, color: Color.fromRGBO(255, 176, 103, 1))),
                ],
              ),
            ),
            // child: Text(
            //   "Cup Coffee",
            //   style: TextStyle(color: Colors.red, fontFamily: 'ComicSansMS', fontSize: 50),
            // ),
          ),
        )
      ],
    ));
  }
}

// Future getConnectData() async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//     Get.offAll(ConnectionError());
//   }
// }


