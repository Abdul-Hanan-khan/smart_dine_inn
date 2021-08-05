import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  CollectionReference ref = FirebaseFirestore.instance.collection("Detailed Order");
  int srNo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width:size.width*0.120,
                    height: 30,
                    margin: EdgeInsets.only(top: 10, left: 3),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text("Sr.",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Ordered By",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.6,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Email",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.4,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Order Type",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),

                  Container(
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Table No",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.6,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Time Stamp",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Price",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      child: Center(
                        child: Text("Rating",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                height: size.height * 0.7,
                width: size.width * 3.34,
                child: ListView(
                  children: [
                    StreamBuilder(
                        stream: ref.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                          return Container(
                            height: size.height * 0.7,
                            width: size.width * 3.24,
                            child: ListView.builder(
                                itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                                itemBuilder: (_, index){
                                  srNo=index+1;
                                  return
                                    Row(
                                    children: [
                                      Container(
                                        width:size.width*0.120,
                                        height: 25,
                                        margin: EdgeInsets.only(left: 2),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                        ),
                                        child: Center(
                                          child: Text("$srNo",style: TextStyle(
                                            fontSize: 20
                                          ),),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.7,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5,top: 3),
                                          child: Text(snapshot.data.docs[index].get('ordered_by'),
                                              style: GoogleFonts.raleway(
                                              )),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.6,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('email'),
                                              style: GoogleFonts.raleway()),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.4,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('order_type'),
                                              style: GoogleFonts.raleway()),
                                        ),
                                      ),

                                      Container(
                                        height: 25,
                                        width: size.width * 0.3,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('table_no'),
                                              style: GoogleFonts.raleway(
                                              )),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.6,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('time_stamp').toString(),
                                              style: GoogleFonts.raleway(
                                              )),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.3,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('price'),
                                              style: GoogleFonts.raleway(
                                              )),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: size.width * 0.3,

                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.grey)),
                                        child: Center(
                                          child: Text(snapshot.data.docs[index].get('rating').toString(),
                                              style: GoogleFonts.raleway(
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            ),
                          );

                        }


                    )






                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
