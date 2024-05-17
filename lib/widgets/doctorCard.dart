import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/constants/constants.dart';

Widget TeachCard2(double height, double width, String ngo, String address, String time) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.25,
      // width: width * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.2,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.shutterstock.com/image-photo/covid19-coronavirus-outbreak-healthcare-workers-260nw-1933145801.jpg"),
                          fit: BoxFit.cover)
                      // image: DecorationImage(image: AssetImage(pic))
                      ),
                ),
                Text(
                  "Ajay Chaudhary",
                  style: GoogleFonts.dmSans(
                      color: Colors.black, fontSize: height * 0.018, fontWeight: FontWeight.w500),
                ),
                // IconWithText1(height, Icons.person, green3, "Nitish Chaurasiya"),
              ],
            ),
            SizedBox(
              width: width * 0.04,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: width * 0.45,
                  height: height * 0.05,
                  child: Expanded(
                    child: Text(
                      ngo,
                      style:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                IconWithText1(
                  height,
                  Icons.location_on_sharp,
                  Colors.red,
                  address,
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.calendar_month, green2, "Closed : Sunday"),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.watch_later_outlined, green2, time),
                Expanded(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: width * 0.25,
                        height: height * 0.038,
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: green1, borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          "Select",
                          style: GoogleFonts.dmSans(fontSize: height * 0.02, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: height * 0.018,
                          backgroundColor: green1,
                          child: Center(
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        CircleAvatar(
                          radius: height * 0.018,
                          backgroundColor: green1,
                          child: Center(
                            child: Icon(
                              Icons.messenger,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget IconWithText1(double height, IconData icon, Color color, String text) {
  return Row(
    children: [
      Icon(
        icon,
        size: height * 0.025,
        color: color,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.018),
      ),
    ],
  );
}
