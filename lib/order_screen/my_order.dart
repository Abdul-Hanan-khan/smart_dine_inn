import 'dart:io';

import 'package:blinking_text/blinking_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/dummy.dart';
import 'package:fyp_v1/entry_points/login_screen.dart';
import 'package:fyp_v1/home_page.dart';
import 'package:fyp_v1/order_screen/order_screen.dart';
import 'package:fyp_v1/rating/rating.dart';
import 'package:fyp_v1/rating/rating_var.dart';
import 'package:fyp_v1/variables/order_items_var.dart';
import 'package:fyp_v1/variables/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fyp_v1/rating/rating.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  String tblAvailabilityDocId;
  final userRef = FirebaseFirestore.instance.collection('tbl_availability');

  CollectionReference ref =
      FirebaseFirestore.instance.collection("Detailed Order");
  String orderStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDateAndTime();
    getOrderStatus();
    getTblAvailabilityDocId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Order"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            orderStatus == "false"
                ? Center(child: Text("Ooops you have no order in progress "))
                : Column(
                    children: [
                      BlinkText(
                        "Thanks...",
                        style:
                            TextStyle(color: Colors.orangeAccent, fontSize: 40),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          "Thanks for using our services, your order will be served to you within 10 minutes",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(fontSize: 20)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          FlutterSession().set('orderStatus', false);
                          getOrderStatus();
                          updateTableAvailability(true).whenComplete(() => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DummyClass()))
                              });

                          // placeDetailedOrder();
                        },
                        child: Text("Finish"),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Future getOrderStatus() async {
    dynamic getCurrentOrderStatus = await FlutterSession().get('orderStatus');
    setState(() {
      orderStatus = getCurrentOrderStatus.toString();
    });
    print(
        "Current order status ::::::::::::::::::::::::::::::::::::::::::::: " +
            orderStatus);
  }

  void getDateAndTime() {
    DateTime now = new DateTime.now();
    print("Current date and time is===== $now");
  }

  Future updateTableAvailability(bool value) async {
    print("current table no to update:" + Variables.tableNo);
    await userRef.doc(tblAvailabilityDocId).update({
      Variables.tableNo: value,
    });
    print("//////////////////////////////////////////////////////////table no ${Variables.tableNo} is updated to $value///////////////////////////////////////////////////////");
  }

  Future getTblAvailabilityDocId() async {
    await FirebaseFirestore.instance
        .collection("tbl_availability")
        .get()
        .then((value) => {
              tblAvailabilityDocId = value.docs[0].id,
              print("your table doc id :" + tblAvailabilityDocId),
            });
  }
}
