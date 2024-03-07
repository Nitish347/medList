import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

Widget newDropDown(double height, double width, List<String> list, Function(String) fun,
    IconData icon, String hint) {
  return Container(
    height: 0.060 * height,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.white.withOpacity(0.8),
      border: Border.all(
        color: green5,
        width: 1.0,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: green1,
        ),
        SizedBox(width: 0.02 * height),
        Expanded(
          child: DropdownButtonFormField<String>(
            validator: (val) {},
            decoration: InputDecoration.collapsed(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 0.021 * height,
                  color: Colors.green.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
            ),
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              fun(newValue!);
            },
          ),
        ),
      ],
    ),
  );
}
