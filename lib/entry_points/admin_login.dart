import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fyp_v1/drawer_screens/admin_page.dart';
import 'package:fyp_v1/top_bars/top_bar_admin.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_page.dart';
import '../signUp_screens.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _secureText = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool formValidationSuccess = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBarAdmin(),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                  child: Text("Admin :",style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                  ),),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    controller: passwordController,
                    autofocus: true,
                    onSaved: (String value) {},
                    validator: passwordValidationMixin,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _secureText ? Icons.remove_red_eye : Icons.security,
                          color: Colors.orangeAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                    ),
                    obscureText: _secureText,
                  ),
                ),

                    Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(

                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  formValidationSuccess = true;
                                }
                                if (formValidationSuccess == true) {
                                  adminLogin();
                                  setState(() {
                                    isLoading = true;
                                  });
                                }

                                //
                              },
                              child: SizedBox(
                                width: 100,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            ),
                          ],
                        ),
                      )

              ],
            ),
          ),
        ),
      ),
    );
  }

  String passwordValidationMixin(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
  }

  void adminLogin()  {
 if(passwordController.text=="admin1234"){
passwordController.clear();
   Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminPage()));
      } else {
   showDialog(
       barrierColor: Colors.white,
       context: context,       builder: (context) {
         return Container(
           decoration:
           BoxDecoration(border: Border.all(color: Colors.amber[300])),
           child: AlertDialog(
             title: Text(
               "Error !",
               style: TextStyle(color: Colors.red),
             ),
             content: Text("Access Denied"),
             backgroundColor: Colors.grey[300],
             actions: [
               FlatButton(
                   onPressed: () {
                     setState(() {
                       isLoading = false;
                     });
                     Navigator.pop(context);
                   },
                   child: Text("ok")),
             ],
           ),
         );
       });
      }

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
