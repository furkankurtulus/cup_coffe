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

Future error(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(Duration(seconds: 15), () {
        SystemNavigator.pop();
      });
      return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            // ignore: deprecated_member_use
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Warning',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'personoNeedInternetConnection',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'pleaseCheckYourConnection',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        color: Colors.redAccent,
                        child: const Text(
                          'Okay',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                  top: -60,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 60,
                    child: Icon(
                      Icons.wifi_off,
                      color: Colors.white,
                      size: 50,
                    ),
                  )),
            ],
          ));
    },
  );
}
