import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget dropdown(List<String> options, String hint, double width, [bool grey = true]) {
  return Container(
    width: width * 0.14,
    child: DropdownMenu<String>(
      width: width * 0.12,
      menuHeight: 300,
      enableFilter: true,
      textStyle: TextStyle(color: Colors.black, fontSize: 14),
      trailingIcon: Icon(
        Icons.arrow_drop_down_rounded,
        color: Colors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey)),
          labelStyle: GoogleFonts.poppins(color: Colors.grey),
          focusColor: Colors.green,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.green.withOpacity(0.5),
          )),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1.5)),
          iconColor: Colors.green),
      // initialSelection: "Select Gender",
      // hintText: "Gender",
      // label: Text(
      //   hint,
      //   style: GoogleFonts.poppins(color: Colors.green),
      // )
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    ),
  );
}

Widget dropdown1(List<String> options, String hint, double width, double height,
    TextEditingController controller, Function(TextEditingController, String) fun, IconData icon,
    [bool grey = true]) {
  return SizedBox(
    child: Expanded(
      child: DropdownMenu<String>(
        width: width * 0.93,
        textStyle: TextStyle(color: Colors.black, fontSize: width * 0.035),
        trailingIcon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.green,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          // labelText: hint,

          // labelStyle: GoogleFonts.poppins(fontSize: height * 0.018, color: Colors.green),
          hintStyle: GoogleFonts.poppins(
              fontSize: height * 0.021,
              color: Colors.green.withOpacity(0.7),
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.all(5),
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
        initialSelection: "Select Gender",
        hintText: hint,
        leadingIcon: Icon(
          icon,
          color: Colors.green,
        ),
        onSelected: (String? value) {
          fun(controller, value!);
        },
        dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    ),
  );
}
