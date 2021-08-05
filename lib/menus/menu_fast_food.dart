import 'package:flutter/material.dart';
import 'package:fyp_v1/order_screen/order_screen.dart';
import 'package:fyp_v1/scrolling_text/moving_text.dart';
import 'package:fyp_v1/variables/order_items_var.dart';

class MenuFastFood extends StatefulWidget {
  @override
  _MenuFastFoodState createState() => _MenuFastFoodState();
}

class _MenuFastFoodState extends State<MenuFastFood> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Fast Food Deals"),
        centerTitle: true,
      ),
      body:
      Column(
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
                text: "Here we have  some amazing deals for you in Fast Food. Hope you like it",
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
                      subtitle: Text("Yari Offer"),
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
                      subtitle: Text("Super Boomer Deal"),
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
                      subtitle: Text("Chaska Pack"),
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
    );
  }

  void deal1() {
    setState(() {
      OrderItemsVar.item1 = "1 XL Pizza";
      OrderItemsVar.item2 = "5 HotWings";
      OrderItemsVar.item3 = "1 Drink 1.5 Ltr";
      OrderItemsVar.item4 = "Chicken Burgers";
      OrderItemsVar.item5 = "Regular Fries";

      OrderItemsVar.price = "1599";
    });
  }

  void deal2() {
    setState(() {
      OrderItemsVar.item1 = "2 Zinger Burgers";
      OrderItemsVar.item2 = "1 Medium Pizza";
      OrderItemsVar.item3 = "1 Drink 1.5 Ltr";
      OrderItemsVar.item4 = "Medium Shawarma";
      OrderItemsVar.item5 = "Chicken Nuggets";

      OrderItemsVar.price = "1499";
    });
  }

  void deal3() {
    setState(() {
      OrderItemsVar.item1 = "Zinger Burger";
      OrderItemsVar.item2 = "Mini Pizza";
      OrderItemsVar.item3 = "Drink 500ml";
      OrderItemsVar.item4 = "Small Shawarma";
      OrderItemsVar.item5 = "Regular Fries";

      OrderItemsVar.price = "999";
    });
  }

  void deal4() {
    setState(() {
      OrderItemsVar.item1 = "2 Large Pizza";
      OrderItemsVar.item2 = "2 Zinger Burgers";
      OrderItemsVar.item3 = "Medium Shawarma";
      OrderItemsVar.item4 = "1.5 Ltr Drink";
      // OrderItemsVar.item5="Regular Fries";

      OrderItemsVar.price = "2800";
    });
  }
}


