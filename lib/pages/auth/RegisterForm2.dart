import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/pages/auth/verify.dart';
import 'package:medlist/widgets/alert.dart';
import 'package:medlist/widgets/newDropdown.dart';

import '../../constants/constants.dart';
import '../../widgets/dropdown.dart';

// import '../../Constants.dart';

class RegisterForm2 extends StatefulWidget {
  @override
  _RegisterForm2State createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _address = TextEditingController();
  String _city = "";
  String _state = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/loginback.jpeg"), fit: BoxFit.cover)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.50, sigmaY: 15.50),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: GoogleFonts.poppins(
                              color: green1, fontWeight: FontWeight.w500, fontSize: height * 0.04),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        title("Address", height),
                        TextFormField(
                          controller: _address,
                          decoration: decoration("Eg. C 83/22 Govindpuram, Ghaziabad", height,
                              Icons.location_on_sharp),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        title("State", height),
                        newDropDown(height, width, ['Khalilabad', 'GKP', "GZB"], (p0) {
                          setState(() {
                            _state = p0;
                          });
                        }, Icons.stacked_bar_chart, 'Select State'),
                        SizedBox(height: height * 0.02),
                        title("City", height),
                        newDropDown(height, width, ['Khalilabad', 'GKP', "GZB"], (p0) {
                          setState(() {
                            _city = p0;
                          });
                        }, Icons.stacked_bar_chart, 'Select State'),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (_state.isEmpty) {
                                  alert(context, "Reuired!", "Select your state", true);
                                } else if (_city.isEmpty) {
                                  alert(context, "Reuired!", "Select your city", true);
                                } else {
                                  Get.to(() => VerifyPage(phoneNumber: "88470867665"));
                                }
                              }
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
                                  "Next",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: height * 0.022,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget title(String text, double height) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 20),
      child: Text(
        text,
        style: GoogleFonts.dmSans(
            fontSize: height * 0.021, color: green1, fontWeight: FontWeight.w600),
      ),
    );
  }

  InputDecoration decoration(String hint, double height, IconData icon) {
    return InputDecoration(
      isDense: true,
      counterText: "",
      hintText: hint,
      filled: true,
      errorStyle: GoogleFonts.poppins(color: green6),
      fillColor: Colors.white.withOpacity(0.8),
      hintStyle: GoogleFonts.poppins(
          fontSize: height * 0.021,
          color: Colors.green.withOpacity(0.7),
          fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.all(height * 0.013),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(50),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.red,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.red,
          )),
      prefixIcon: Icon(
        icon,
        color: green2,
        size: height * 0.025,
      ),
    );
  }
}
