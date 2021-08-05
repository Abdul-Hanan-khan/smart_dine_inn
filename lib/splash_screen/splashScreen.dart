import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/entry_points/login_screen.dart';
import 'package:fyp_v1/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String loginStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLoginStatus();

    Timer(Duration(seconds: 4), () {
      if (loginStatus == 'true') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/onboard/applogo.png",
              width: 200,
              height: 200,
            ),
            // Text(
            //   "Smart Dine Inn",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Smart Dine Inn ',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],

              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ],
        ),
      ),
    );
  }

  Future getLoginStatus() async {
    setState(() {});
    dynamic statusValue = await FlutterSession().get('status');
    loginStatus = statusValue.toString();
    print("========================================================" +
        loginStatus);
  }
}
