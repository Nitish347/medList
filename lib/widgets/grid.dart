import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class grid extends StatelessWidget {
  grid(
      {this.selected,
      this.onTap,
      this.branch,
      this.images,
      this.width,
      this.heigth});
  final double? heigth;
  final double? width;
  final String? branch;
  final String? images;
  final VoidCallback? onTap;
  final bool? selected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(2.0),
          height: heigth,
          width: width,
          decoration: BoxDecoration(
              boxShadow: selected ?? false
                  ? Constants.neumorphic2
                  : Constants.neumorphic1,
              borderRadius: BorderRadius.circular(15),
              gradient: Constants.purplegradient1),
          child: Stack(
            children: [
              Center(
                child: Container(
                    height: 130, width: 130, child: Lottie.asset(images!)),
              ),
              Positioned(
                left: 10,
                top: 5,
                child: Text(
                  branch!,
                  style: GoogleFonts.alice(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
