import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlist/FirestoreMethods/SaveUser.dart';
import 'package:medlist/Hive/writeData.dart';
import 'package:medlist/db/sqflite.dart';
import 'package:medlist/pages/home.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';
import 'login.dart';

// import 'package:shared_preferences/shared_preferences.dart';
class VerifyPage extends StatefulWidget {
  static String id = "verifyPage";
  String phoneNumber = "";
  VerifyPage({required this.phoneNumber});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

String otp = "";
FirebaseAuth auth = FirebaseAuth.instance;

String verficationID_received = "";

bool next = false;

bool otp_visible = false;

class _VerifyPageState extends State<VerifyPage> {
  @override
  void initState() {
    // TODO: implement initState

    verify(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 10,
                  ),
                  Text(
                    "Verify with OTP",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Divider(
                    height: 10,
                  ),
                  Text(
                    "Sent to +91 ${"phoneNumber"}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.6)),
                      child: Padding(
                        padding: EdgeInsets.only(right: 15, bottom: 2),
                        child: TextField(
                          maxLength: 6,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            otp = value;
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              hintText: "Enter OTP",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: height/25,),
                  InkWell(
                    onTap: () {
                      verifycode(otp, context);
                      // print(otp);
                      // print(LoginPage.phoneNumber);
                      // if (otp_visible == true) {
                      //   verifycode();
                      // }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              // fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
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
        ],
      ),
    );
  }

  void verify(String PhoneNumber) {
    print(5);
    auth.verifyPhoneNumber(
        phoneNumber: "+91$PhoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("login successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verficationID, int? resendtoken) {
          verficationID_received = verficationID;
          setState(() {
            // otp_visible = true;
          });
        },
        codeAutoRetrievalTimeout: (String verficationID) {});
    print("code sent");
  }

  void verifycode(String otp, BuildContext context) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    print("nitish");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verficationID_received, smsCode: otp);
    await auth.signInWithCredential(credential).then((value) async {
      final User? user = auth.currentUser;
      final uid = user?.uid;
      // await FirestoreMethods().uploadData(widget.user.toJson(), uid!);
      print("logged in successfully");
      SaveUser.saveUser(context, uid!);
      MedicineSave _alarmHelper = MedicineSave();
      _alarmHelper.initializeDatabase().then((value) {
        print("*******************ho gyaa");
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    uid: "MBD6ejDLY8eaPm1pFLWC9gNaD2E2",
                  )));
    });
  }
}
