import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  String title = '';
  Appbar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.pinkAccent,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 25,
            color: Colors.white,
            shadows: [BoxShadow(color: Colors.black, blurRadius: 5)]),
      ),
    );
  }
}
