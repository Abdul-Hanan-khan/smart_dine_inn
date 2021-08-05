import 'package:flutter/material.dart';
import 'package:fyp_v1/order_screen/order_screen.dart';
import 'package:fyp_v1/scrolling_text/moving_text.dart';
import 'package:fyp_v1/variables/order_items_var.dart';

class MenuItalian extends StatefulWidget {
  @override
  _MenuItalianState createState() => _MenuItalianState();
}

class _MenuItalianState extends State<MenuItalian> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Italian Deals"),
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
                  text: "Here we have  some amazing deals for you in Italian Food. Hope you like it",
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
                        subtitle: Text("Hot Deal"),
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
                        subtitle: Text("Special Offer"),
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
                        subtitle: Text("Limited Time Deal"),
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
                        subtitle: Text("Stunner Deal"),
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
      OrderItemsVar.item1 = "Italian Lemon Chicken";
      OrderItemsVar.item2 = "Chicken Fajita Salad";
      OrderItemsVar.item3 = "Italian Rice Omelet";
      OrderItemsVar.item4 = "Mushroom Risotto";
      OrderItemsVar.item5 = "1 Drink 1 Ltr";

      OrderItemsVar.price = "1700";
    });
  }

  void deal2() {
    setState(() {
      OrderItemsVar.item1 = "Jujeh Kabab";
      OrderItemsVar.item2 = "Garlic Noodles 1 Bowl";
      OrderItemsVar.item3 = "Half Italian Rice Omelet";
      OrderItemsVar.item4 = "Half Mushroom Risotto";
      OrderItemsVar.item5 = "1 Italian Lemon Chicken";

      OrderItemsVar.price = "1600";
    });
  }

  void deal3() {
    setState(() {
      OrderItemsVar.item1 = "Smoked Macaroni";
      OrderItemsVar.item2 = "Moist Orange Cake";
      OrderItemsVar.item3 = "Garlic Noodles 2 Bowls";
      OrderItemsVar.item4 = "1.5 Ltr Drink";
      OrderItemsVar.item5 = "Pasta Carbonara";

      OrderItemsVar.price = "2300";
    });
  }

  void deal4() {
    setState(() {
      OrderItemsVar.item1 = "1 Pasta Carbonara";
      OrderItemsVar.item2 = "Moist Orange";
      OrderItemsVar.item3 = "1 Italian Lemon Chicken";
      OrderItemsVar.item4 = "1.5 Ltr Drink";
      OrderItemsVar.item5="Half Mashroom Risotto";

      OrderItemsVar.price = "3250";
    });
  }
}
