import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/get_user_location.dart';
import 'package:fyp_v1/order_screen/my_order.dart';
import 'package:fyp_v1/variables/order_items_var.dart';
import 'package:fyp_v1/variables/variables.dart';
import 'package:intl/intl.dart';

import '../home_page.dart';

class OrderScreen extends StatefulWidget {
  // String item1;
  // String item2;
  // String item3;
  //
  // OrderScreen(this.item1, this.item2, this.item3);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String tblAvailabilityDocId;
  double userDistance;
  final userRef = FirebaseFirestore.instance.collection('tbl_availability');
  Size size;
  TextEditingController tableNoCtr = TextEditingController();
  String tableNo;
  CollectionReference ref = FirebaseFirestore.instance
      .collection(OrderItemsVar.orderCategory + " Order");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTblAvailabilityDocId();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // widget.item1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Order Details Are",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    OrderItemsVar.item1.isEmpty
                        ? ""
                        : OrderItemsVar.item1.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    OrderItemsVar.item2.isEmpty
                        ? ""
                        : OrderItemsVar.item2.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    OrderItemsVar.item3.isEmpty
                        ? ""
                        : OrderItemsVar.item3.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    OrderItemsVar.item4.isEmpty
                        ? ""
                        : OrderItemsVar.item4.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    OrderItemsVar.item5.isEmpty
                        ? ""
                        : OrderItemsVar.item5.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(OrderItemsVar.price + ".Rs"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        // onPressed: getTableNo,
                        onPressed: () {
                          var userLocation = UserLocation();
                          userLocation.getCurrentPosition().then((value) => {
                                if (UserLocation.userDistance > 500000.0)
                                  {
                                    print(
                                        "======================== your are ${UserLocation.userDistance} meters away"),
                                    showDialogeForUserLocation(
                                        context, "Out of reach")
                                  }
                                else
                                  {
                                    print(
                                        "======================== your are ${UserLocation.userDistance} meters away"),
                                    UserLocation.userDistance = 0.0,
                                    getTableNo()
                                  }
                              });
                        },

                        child: Text(
                          "Order Now",
                          style: TextStyle(color: Colors.black),
                        ),
                        splashColor: Colors.white,
                        color: Colors.orangeAccent[100],
                        elevation: 5,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> getTableNo() {
    final formKey = GlobalKey<FormState>();
    return showDialog(
          barrierColor: Colors.blue.withOpacity(0.2),
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
                  'Enter Table No',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: tableNoCtr,
                  keyboardType: TextInputType.number,
                  validator: tableNoValidation,
                  decoration: InputDecoration(
                    hintText: "Enter Table No",
                  ),
                ),
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    print("valid value");
                    processingDialog();
                    checkAvailability();
                  } else {
                    print("Not validated");
                  }
                },
                child: Text('ok', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ) ??
        false;
  }

  String tableNoValidation(String value) {
    int tbNo = int.parse(value);
    if (value.isEmpty) {
      return "Please Enter table no !";
    } else if (tbNo > 10 || tbNo < 1) {
      return "Please enter between 1 and 10";
    }
  }

  Future checkAvailability() async {
    await FirebaseFirestore.instance
        .collection("tbl_availability")
        .where(tableNoCtr.text.toString(), isEqualTo: true)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        Variables.tableNo = tableNoCtr.text.toString();
        placeOrder();
      } else {
        showDialog(
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
                    Icons.error_outline,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Table Not Available, Select Again',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ),
        );
        print("table not available");
      }
    });
  }

  Future placeOrder() async {
    var dbTimeKey = new DateTime.now();

    var formateDate = new DateFormat('MMM d, yyyy');
    var formateTime = new DateFormat('EEEE, hh:mm aaa');
    String date = formateDate.format(dbTimeKey);
    String time = formateTime.format(dbTimeKey);

    print("Order type is " + OrderItemsVar.orderCategory);

    // ref.doc(Variables.first_name+" "+Variables.last_name).set({
    ref.add({
      'Item1': OrderItemsVar.item1,
      'Item2': OrderItemsVar.item2,
      'Item3': OrderItemsVar.item3,
      'Item4': OrderItemsVar.item4,
      'Item5': OrderItemsVar.item5,
      'Price': OrderItemsVar.price,
      'Order_By': Variables.first_name + "  " + Variables.last_name,
      'table_no': Variables.tableNo,
      'time_stamp': time + " " + date,
      'Email': Variables.email
    }).whenComplete(() => {
          updateTableAvailability(false).whenComplete(() => {
                FlutterSession().set('orderStatus', true),
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyOrder()))
              })
        });
  }

  Future updateTableAvailability(bool value) async {
    print("current table no to update:" + Variables.tableNo);
    await userRef.doc(tblAvailabilityDocId).update({
      Variables.tableNo: value,
    });
    print(
        "//////////////////////////////////////////////////////////table no ${Variables.tableNo} is updated to $value///////////////////////////////////////////////////////");
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

  void processingDialog() {
    showDialog(
      barrierColor: Colors.blue.withOpacity(0.4),
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )),
            SizedBox(
              width: 10,
            ),
            Text(
              ' Processing ',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void showDialogeForUserLocation(BuildContext context, String msg) {
    showDialog(
      barrierColor: Colors.blue.withOpacity(0.4),
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              msg,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("ok"))
        ],
      ),
    );
  }
}
