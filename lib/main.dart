import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_v1/home_page.dart';
import 'package:fyp_v1/login_screen.dart';
import 'package:fyp_v1/on_boarding/intro_screen.dart';
import 'package:fyp_v1/splash_screen/animated_splash_screen.dart';
import 'package:fyp_v1/splash_screen/splashScreen.dart';
import 'package:fyp_v1/variables/variables.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  dynamic status = await FlutterSession().get('status');
  String status2 = status.toString();
  // getUserLoggedIn().then((value) => getUserById());
  runApp(
    MyApp(
      status: status2,
    ),
  );
}

Future getUserLoggedIn() async {
  dynamic getCurrentUser = await FlutterSession().get('Email');
  Variables.userLoggedIn = getCurrentUser.toString();
  print(Variables.userLoggedIn);
}

getUserById() {
  final String id = Variables.userLoggedIn;
  final userRef = FirebaseFirestore.instance.collection('Users');

  userRef.doc(id).get().then((DocumentSnapshot doc) {
    Variables.first_name = (doc.data()['FirstName'].toString());
    Variables.last_name = (doc.data()['LastName'].toString());
    Variables.email = (doc.data()['Email'].toString());
    Variables.password = (doc.data()['Password'].toString());
    Variables.phone_number = (doc.data()['Phone No'].toString());
    Variables.gender = (doc.data()['Gender'].toString());
    Variables.disability = (doc.data()['Disability Type']).toString();
    Variables.dob = (doc.data()['DOB']).toString();
    Variables.nationality = (doc.data()['Nationality'].toString());
  });

}

class MyApp extends StatelessWidget {
  String status;
  MyApp({this.status});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      title: 'Curved Path',

      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: status == 'true' ? HomeScreen() : LoginScreen(),
      // home: AdminLogin(),
      home: SplashScreen(),
      // home: AnimatedSplashSC(),
      // home: LoginScreen(),
      // home: NewsHome(),
      // home:  IntroScreen(),
      // home: HomeScreen(),
      // home: MyOrder(),
      // home:  AdminPage(),
      // home: Rating(),
      // home: GoogleMapScreen(),
    );
  }
}



class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text("Splash Screen",style: TextStyle(
          color: Colors.white
      ),),),
    );
  }
}
