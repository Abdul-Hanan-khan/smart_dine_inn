import 'package:flutter/material.dart';
import 'package:fyp_v1/order_screen/order_screen.dart';
import 'package:fyp_v1/scrolling_text/moving_text.dart';
import 'package:fyp_v1/variables/order_items_var.dart';

class MenuContinental extends StatefulWidget {
  @override
  _MenuContinentalState createState() => _MenuContinentalState();
}

class _MenuContinentalState extends State<MenuContinental> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Continental Deals"),
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
                  text: "Here we have  some amazing deals for you in Continental Food. Hope you like it",
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
                        subtitle: Text("Ramadan Special"),
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
                        subtitle: Text("Mid Night Deal"),
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
                        subtitle: Text("Grill n Grill Deal"),
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
                        subtitle: Text("Charmin Lunch"),
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
      OrderItemsVar.item1 = "1 Chicken and Chinese Salad";
      OrderItemsVar.item2 = "Half Pasta Salad";
      OrderItemsVar.item3 = "Half Apple Sausage Plait";
      OrderItemsVar.item4 = "Paneer Steak";
      OrderItemsVar.item5 = "Butter Fried Fish";

      OrderItemsVar.price = "2999";
    });
  }

  void deal2() {
    setState(() {
      OrderItemsVar.item1 = "1 Pasta Salad";
      OrderItemsVar.item2 = "2 Apple Sausage Plait";
      OrderItemsVar.item3 = "1 Paneer Steak";
      OrderItemsVar.item4 = "Baked Potato Aubergines";
      OrderItemsVar.item5 = "1 Ltr Drink";

      OrderItemsVar.price = "1800";
    });
  }

  void deal3() {
    setState(() {
      OrderItemsVar.item1 = "Roesti And Salad";
      OrderItemsVar.item2 = "2 Paneer Steaks";
      OrderItemsVar.item3 = "1 Pasta Salad";
      OrderItemsVar.item4 = "1 Half Ltr Drink";
      OrderItemsVar.item5 = "Chicken Chinese";

      OrderItemsVar.price = "2600";
    });
  }

  void deal4() {
    setState(() {
      OrderItemsVar.item1 = "Roesti And Salad";
      OrderItemsVar.item2 = "Butter Fried Fish";
      OrderItemsVar.item3 = "1 Paneer Steak";
      OrderItemsVar.item4 = "1 Half Ltr Drink ";
      OrderItemsVar.item5 = "2 Apple Sausage Plaint";

      OrderItemsVar.price = "2050";
    });
  }
}

