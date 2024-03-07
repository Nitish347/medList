import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/widgets/alert.dart';
import 'package:medlist/widgets/newDropdown.dart';

import '../../constants/constants.dart';
import '../../widgets/dropdown.dart';
import 'RegisterForm2.dart';

// import '../../Constants.dart';

class RegisterForm1 extends StatefulWidget {
  @override
  _RegisterForm1State createState() => _RegisterForm1State();
}

class _RegisterForm1State extends State<RegisterForm1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String _gender = 'Select Gender';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
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
                          "Create Account",
                          style: GoogleFonts.poppins(
                              color: green1, fontWeight: FontWeight.w500, fontSize: height * 0.04),
                        ),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        title("Name", height),
                        TextFormField(
                          controller: _name,
                          decoration: decoration("Eg. Nitish", height, Icons.person),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            // You can add more complex email validation if needed
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        title("Phone Number", height),
                        TextFormField(
                          maxLength: 10,
                          controller: _phoneNumberController,
                          decoration: decoration("Eg 9852xxxxxx", height, Icons.phone),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            // You can add more phone number validation if needed
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        title("Age", height),
                        TextFormField(
                          controller: _age,
                          maxLength: 2,
                          decoration: decoration("Eg 23", height, Icons.accessibility),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            // You can add more phone number validation if needed
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        title("Gender", height),
                        newDropDown(
                            height,
                            width,
                            ['Male', 'Female'],
                            (p0) => {
                                  setState(() {
                                    _gender = p0;
                                  }),
                                },
                            Icons.male,
                            'Select Gender'),
                        SizedBox(height: height * 0.02),
                        SizedBox(height: height * 0.02),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              if (_gender == 'Select Gender') {
                                alert(context, "Required", "Select Gender", true);
                              } else if (_formKey.currentState?.validate() ?? false) {
                                Get.to(() => RegisterForm2());
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
