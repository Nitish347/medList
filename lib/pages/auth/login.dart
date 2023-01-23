import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/pages/auth/verify.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';

class LoginPage extends StatelessWidget {
  static String id = "loginPage";
  static String phoneNumber = "";
  static String name = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginback.jpeg"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.50, sigmaY: 1.50),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              height: height / 1.2,
              width: width / 1.2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.6)),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              name = value;
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            onEditingComplete: () {
                              if (phoneNumber.toString().length > 10)
                                print("noooo");
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Your Name",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.withOpacity(0.6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) {
                              phoneNumber = value;
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            onEditingComplete: () {
                              if (phoneNumber.toString().length > 10)
                                print("noooo");
                            },
                            decoration: InputDecoration(
                                // prefix: Text("  +91"),
                                prefixText: ("  +91 "),
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: height/25,),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: InkWell(
                        onTap: () async {
                          await FirestoreData.userData(context);
                          print(provider.user?.phoneNumber);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => VerifyPage()));
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
