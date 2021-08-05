import 'package:flutter/material.dart';
import 'package:fyp_v1/order_screen/order_screen.dart';
import 'package:fyp_v1/scrolling_text/moving_text.dart';
import 'package:fyp_v1/variables/order_items_var.dart';
class MenuChinese extends StatefulWidget {
  @override
  _MenuChineseState createState() => _MenuChineseState();
}

class _MenuChineseState extends State<MenuChinese> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Chinese Deals"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              // color: Colors.grey,
              height: size.height*0.3,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 5),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScrollingText(
                  text: "Here we have  some amazing deals for you in Chinese Food. Hope you like it",
                  textStyle: TextStyle(fontSize: 29,color: Colors.white),
                ),
              ),
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(height: 30,),
            // getListView(),
            Container(
              width: size.width,
              // height: size.height*0.5,
              height: size.height*0.47,
              // color: Colors.grey,
              child: ListView(
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        // leading: Icon(Icons.landscape),
                        title: Text("Deal 1"),
                        subtitle: Text("Single Deal"),
                        // trailing: Icon(Icons.wb_sunny),
                      ),
                    ),
                    onTap: () {
                      deal1();
                      print(OrderItemsVar.price);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        // leading: Icon(Icons.landscape),
                        title: Text("Deal 2"),
                        subtitle: Text("Family Deal"),
                        // trailing: Icon(Icons.wb_sunny),
                      ),
                    ),
                    onTap: () {
                      deal2();
                      print(OrderItemsVar.price);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        // leading: Icon(Icons.landscape),
                        title: Text("Deal 3"),
                        subtitle: Text("Combo Deal"),
                        // trailing: Icon(Icons.wb_sunny),
                      ),
                    ),
                    onTap: () {
                      deal3();
                      print(OrderItemsVar.price);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        // leading: Icon(Icons.landscape),
                        title: Text("Deal 4"),
                        subtitle: Text("Special Deal"),
                        // trailing: Icon(Icons.wb_sunny),
                      ),
                    ),
                    onTap: () {
                      deal4();
                      print(OrderItemsVar.price);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void deal1() {
    setState(() {
      OrderItemsVar.item1 = "Half Chicken Manchurian + Rice";
      OrderItemsVar.item2 = "1 Drumstick";
      OrderItemsVar.item3 = "1 Drink Half Ltr";
      OrderItemsVar.item4 = "Chowmein Special Beef";
      OrderItemsVar.item5 = "Fried Finger Fries";

      OrderItemsVar.price = "900";
    });
  }

  void deal2() {
    setState(() {
      OrderItemsVar.item1 = "Black Pepper Chicken + Rice";
      OrderItemsVar.item2 = "Chicken Chowmein";
      OrderItemsVar.item3 = "1 Medium Noodle Bowl";
      OrderItemsVar.item4 = "1 Ltr Drink";
      OrderItemsVar.item5 = "3 Drumsticks";

      OrderItemsVar.price = "1700";
    });
  }

  void deal3() {
    setState(() {
      OrderItemsVar.item1 = "Family Bowl Soup";
      OrderItemsVar.item2 = "Half Chicken Chaomin";
      OrderItemsVar.item3 = "Manchurain Rice";
      OrderItemsVar.item4 = "Fried Finger Fish";
      OrderItemsVar.item5 = "1 Drink 1 Ltr";

      OrderItemsVar.price = "2999";
    });
  }

  void deal4() {
    setState(() {
      OrderItemsVar.item1 = "2 Special Soup";
      OrderItemsVar.item2 = "Special Chaomin";
      OrderItemsVar.item3 = "Chicken Almond Rice";
      OrderItemsVar.item4 = "2 Drumsticks";
      OrderItemsVar.item5="Dry Fish with Vegetable / Fried Finger Fish";

      OrderItemsVar.price = "1800";
    });
  }
}
