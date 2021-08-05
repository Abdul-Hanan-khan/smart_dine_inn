//HomeScreen
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/drawer_screens/admin_page.dart';
import 'package:fyp_v1/entry_points/admin_login.dart';
import 'package:fyp_v1/menus/menu_chinese.dart';
import 'package:fyp_v1/menus/menu_italian.dart';
import 'package:fyp_v1/order_screen/my_order.dart';
import 'package:fyp_v1/variables/order_items_var.dart';
import 'package:fyp_v1/variables/variables.dart';

import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';
import 'menus/menu_continental.dart';
import 'menus/menu_fast_food.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderStatus();
    getUserLoggedIn().then((value) => getUserById());
  }

  String orderStatus;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: new Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(Variables.first_name+" "+Variables.last_name,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              accountEmail: Text(Variables.email,style: TextStyle(
                color: Colors.white
              ),),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://p1.hiclipart.com/preview/823/765/288/login-icon-system-administrator-user-user-profile-icon-design-avatar-face-head-png-clipart.jpg"),
                  ),
                  onTap: () => print("Current User")),

              //.. This line of code provides the usage of multiple accounts
              /* otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: ()=> switchUser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(otherProfilePic)
                  ),
                ),
              ], */

              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")),
              ),
            ),
            ListTile(
                title: Text("Home Page"),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(
                  //   new MaterialPageRoute(
                  //     builder: (BuildContext context) => OtherPage("Home Page"),
                  //   ),
                  // );
                }),
            ListTile(
                title: Text("My Order"),
                trailing: Icon(Icons.info),
                onTap: () {
                  // if (orderStatus == "false") {
                  //   print(" No Current order Now");
                  // } else {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => MyOrder(),
                    ));
                  // }
                }),
            ListTile(
                title: Text("Admin Login"),
                trailing: Icon(Icons.login),
                onTap: () {
                  // Navigator.of(context).pop();

                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AdminLogin(),
                  ));
                }),
            ListTile(
                title: Text("Support"),
                trailing: Icon(Icons.contact_support_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //   builder: (BuildContext context) => OtherPage("About Page"),
                  // ));
                }),
            ListTile(
                title: Text("Settings Page"),
                trailing: Icon(Icons.security),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //   builder: (BuildContext context) =>
                  //       OtherPage("Settings Page"),
                  // ));
                }),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.cancel),
              onTap: () {
                FlutterSession().set("status", false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        )),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Image(image: AssetImage('assets/images/italianCover.PNG'),width: 330,height: 200,),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage('assets/images/fastFoodImg.jpg'),
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Text("Fast Food",
                            style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 30,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  OrderItemsVar.orderCategory = "Fast Food";
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuFastFood()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Image(image: AssetImage('assets/images/italianCover.PNG'),width: 330,height: 200,),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image(
                              image:
                                  AssetImage('assets/images/italianCover.PNG'),
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Text(
                          "Italian",
                          style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  OrderItemsVar.orderCategory = "Italian";
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuItalian()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Image(image: AssetImage('assets/images/italianCover.PNG'),width: 330,height: 200,),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image(
                              image:
                                  AssetImage('assets/images/chineseCover.jpg'),
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Text("Chinese",
                            style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 30,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  OrderItemsVar.orderCategory = "Chinese";
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuChinese()));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Image(image: AssetImage('assets/images/italianCover.PNG'),width: 330,height: 200,),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/continentalCover.jpg'),
                              width: size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Text("Continental",
                            style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 30,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  OrderItemsVar.orderCategory = "Continental";
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuContinental()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future getUserLoggedIn() async {
    dynamic getCurrentUser = await FlutterSession().get('Email');
    Variables.userLoggedIn = getCurrentUser.toString();
    print(
        "Current use logged in ::::::::::::::::::::::::::::::::::::::::::::: " +
            Variables.userLoggedIn);
  }

  Future getOrderStatus() async {
    setState(() {});
    dynamic getCurrentOrderStatus = await FlutterSession().get('orderStatus');
    orderStatus = getCurrentOrderStatus.toString();
    print(
        "Current order status ::::::::::::::::::::::::::::::::::::::::::::: " +
            orderStatus);
  }

  getUserById() {
    final String id = Variables.userLoggedIn;
    print('===================user id' + id);
    final userRef = FirebaseFirestore.instance.collection('Users');

    userRef.doc(id).get().then((DocumentSnapshot doc) {
      setState(() {
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
    });
  }

  Future<bool> onWillPop() {
    return showDialog(
          barrierColor: Colors.blue.withOpacity(0.4),
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add_alert,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Are you sure?',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Do you want to exit.',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No', style: TextStyle(color: Colors.blue)),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text('Yes', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }
}
