import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/home_page.dart';
import 'package:fyp_v1/rating/rating_var.dart';
import 'package:fyp_v1/variables/order_items_var.dart';
import 'package:fyp_v1/variables/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../dummy.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final userRef = FirebaseFirestore.instance.collection('Detailed Order');
  CollectionReference ref = FirebaseFirestore.instance.collection("Detailed Order");
  var rating = 0.0;
  TextEditingController complainCtr=TextEditingController();
  String complainText;
  Email email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating bar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.orange),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment:Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" Rate Our Services",style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 20
                          )
                      ),),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                      child: SmoothStarRating(
                        color: Colors.orange[300],
                        borderColor: Colors.grey,
                        rating: rating,
                        size: 45,
                        starCount: 5,
                        onRated: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                      )),
                  SizedBox(height: 15,),
                  rating >=0.5 && rating<=2 ?
                  Column(
                    children: [
                      Text("   Please tell us what should be improved",style: GoogleFonts.raleway(textStyle: TextStyle(color: Colors.red))),
                      TextFormField(decoration: InputDecoration(hintText: 'Please enter your remarks'),controller: complainCtr,onChanged: (value){
                        complainText=value;

                      },)
                    ],
                  )
                      :Container(),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                    onPressed: () {
                      setState(()   {
                        RatingVariable.ratingValue=rating;
                        if(complainCtr.text.isNotEmpty){


                          // String username = 'atifkhan61391@gmail.com';
                          // String password = 'gtavicecity123';
                          //
                          // final smtpServer = gmail(username, password);
                          // // Use the SmtpServer class to configure an SMTP server:
                          // // final smtpServer = SmtpServer('smtp.domain.com');
                          // // See the named arguments of SmtpServer for further configuration
                          // // options.
                          //
                          // // Create our message.
                          // final message = Message()
                          //   ..from = Address(username, 'hanankhanajk@gmail.com')
                          //   ..recipients.add('hanankhanajk@gmail.com')
                          //   // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
                          //   // ..bccRecipients.add(Address('bccAddress@example.com'))
                          //   ..subject = 'User Complain'
                          //   ..text = '${complainCtr.text}';
                          //   // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
                          //
                          // try {
                          //   final sendReport =  send(message, smtpServer);
                          //   print('Message sent: ' + sendReport.toString());
                          // } on MailerException catch (e) {
                          //   print('Message not sent.');
                          //   for (var p in e.problems) {
                          //     print('Problem: ${p.code}: ${p.msg}');
                          //   }
                          // }












                         email=Email(
                            body: '${complainText.toString()}',
                            subject: 'User Complain',
                            recipients: ['hanankhanajk@gmail.com'],
                            // cc: ['cc@example.com'],
                            // bcc: ['bcc@example.com'],
                            // attachmentPaths: ['/path/to/attachment.zip'],
                            isHTML: false,
                          );
                          FlutterEmailSender.send(email);
                        }
                      });
                      placeDetailedOrder();
                      // updateRatingToDb();
                      print(
                          "User rated ==================================== : $rating");
                    },
                    child: Text("Submit"),
                    elevation: 4,
                    splashColor: Colors.orange,
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future placeDetailedOrder() async {
    var dbTimeKey = new DateTime.now();

    var formateDate = new DateFormat('MMM d, yyyy');
    var formateTime = new DateFormat('EEEE, hh:mm aaa');
    String date = formateDate.format(dbTimeKey);
    String time = formateTime.format(dbTimeKey);

    print(Variables.first_name);
    print(Variables.last_name);
    print(Variables.email);
    print(Variables.password);
    print(Variables.nationality);
    print(Variables.gender);
    print(Variables.phone_number);
    print("Order type is " + OrderItemsVar.orderCategory);

    // ref.doc(Variables.first_name+" "+Variables.last_name).set({
    ref.add({
      'ordered_by': Variables.first_name + " " + Variables.last_name,
      'email': Variables.email,
      'order_type': OrderItemsVar.orderCategory,
      'table_no':Variables.tableNo,
      'time_stamp':time+" "+date,
      'price': OrderItemsVar.price,
      'rating': RatingVariable.ratingValue,

    }).whenComplete(() => {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()))
    });
  }

  Future updateRatingToDb() async {
    await FlutterSession().get("userId").then((value) {
      print(value.toString());
      userRef.doc(value.toString()).update({
        "Rating": rating,

      });
    });
  }
}
