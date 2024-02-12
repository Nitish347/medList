import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class grid extends StatelessWidget {
  grid({this.selected, this.onTap, this.branch, this.images, this.width, this.heigth});
  final double? heigth;
  final double? width;
  final String? branch;
  final String? images;
  final VoidCallback? onTap;
  final bool? selected;
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(2.0),
          height: heigth,
          width: width,
          decoration: BoxDecoration(
              boxShadow: selected ?? false ? Constants.neumorphic2 : Constants.neumorphic1,
              borderRadius: BorderRadius.circular(15),
              gradient: Constants.purplegradient1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(height: ht * 0.13, child: Lottie.asset(images!)),
              Expanded(
                child: Container(
                  width: wt,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: green2,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
                  child: Text(
                    branch!,
                    style: GoogleFonts.poppins(
                        fontSize: ht * 0.02, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
