import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/FirestoreMethods/SaveUser.dart';
import 'package:medlist/Hive/writeData.dart';
import 'package:medlist/constants/constants.dart';
import 'package:medlist/db/sqflite.dart';
import 'package:medlist/pages/home.dart';
import 'package:pinput/pinput.dart';
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

    // verify(widget.phoneNumber);
  }
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginback.jpeg"), fit: BoxFit.cover)),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.50, sigmaY: 5.50),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height / 10,
                            ),
                            Text(
                              "Verify the OTP",
                              style: TextStyle(
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.w400,
                                  color: green1),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "Sent to +91 ${widget.phoneNumber}",
                              style: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w400,
                                  color: green1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Pinput(
                        length: 4,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: PinTheme(
                            width: height * 0.07,
                            height: height * 0.07,
                            textStyle: TextStyle(
                                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400),
                            decoration: BoxDecoration(
                                color: green6.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: green2, width: 1.5))),
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        keyboardType: TextInputType.number,
                        scrollPadding: EdgeInsets.only(bottom: 140),
                        autofocus: true,
                        closeKeyboardWhenCompleted: false,
                        onSubmitted: (val) {
                          print(val.toString());
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        verifycode(otp, context);
                        // print(otp);
                        // print(LoginPage.phoneNumber);
                        // if (otp_visible == true) {
                        //   verifycode();
                        // }
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width,
                        decoration: BoxDecoration(
                          color: green1,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
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
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verficationID_received, smsCode: otp);
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
                    uid: uid,
                  )));
    });
  }
}
