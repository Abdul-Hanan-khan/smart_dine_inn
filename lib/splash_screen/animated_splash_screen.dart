import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/entry_points/login_screen.dart';
import 'package:fyp_v1/home_page.dart';

class AnimatedSplashSC extends StatefulWidget {
  @override
  _AnimatedSplashSCState createState() => _AnimatedSplashSCState();
}

class _AnimatedSplashSCState extends State<AnimatedSplashSC> {
  String loginStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash:    Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width,),

              Image.asset('assets/onboard/applogo.png',width: 150,height: 150,),
            ],
          ),
              // Text("Smart Dine Inn"),

          nextScreen: loginStatus=='true'?HomeScreen():LoginScreen(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.white
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
