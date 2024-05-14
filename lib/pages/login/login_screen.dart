import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../auth/RegisterForm.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body:Center(child: TextField(),)
    );
  }
  String? validateAbout(String? value) {
    if (value!.isEmpty) {
      return '*required!';
    }
    return null;
  }

  Widget textField1(String hint, bool pass, bool phone, double height, double width, IconData icon,
      TextEditingController controller, String? Function(String?) validator,
      [int length = 1000, bool num = false]) {
    return Container(
      width: width,

      // margin: EdgeInsets.symmetric(vertical: height * 0.02),
      padding: EdgeInsets.all(width * 0.03),
      child: TextFormField(
        controller: controller,
        keyboardType: phone ? TextInputType.number : null,
        maxLength: length,
        obscureText: pass,
        validator: validator,
        decoration: InputDecoration(
          counterText: "",
          hintText: hint,
          suffixIcon: pass
              ? Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          )
              : null,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          // labelText: hint,
          prefixIcon: Icon(
            icon,
            color: green2,
          ),
          // labelStyle: GoogleFonts.poppins(fontSize: height * 0.018, color: Colors.green),
          hintStyle: GoogleFonts.poppins(
              fontSize: height * 0.021,
              color: Colors.green.withOpacity(0.7),
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(left: 10),
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
        ),
      ),
    );
  }
}
