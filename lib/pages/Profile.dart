// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                alignment: Alignment.centerLeft,
                child: Text("Profile",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.04,
                      color: Colors.black87,
                    )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: AvatarGlow(
                  glowColor: Colors.green,
                  glowRadiusFactor: 0.2,
                  // endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,

                  child: Material(
                    // Replace this child with your own
                    elevation: 15.0,
                    shape: CircleBorder(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          // image
                          radius: height * 0.07), // circleAvatar
                    ), // ClipRRect
                  ), // Material
                ), // avatarglow
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Nitish Chaurasiya",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600, fontSize: height * 0.025, color: green1),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: green1,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "+91 8840867665",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.02,
                        color: green1.withOpacity(0.5)),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              profileOptions(height, width, "Edit Profile", "Edit your personal information"),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Clinic/Hospital",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              profileOptions(height, width, "Change Clinic", "Change  your selected clinic"),
              profileOptions(height, width, "Privacy", "Change your password"),
              profileOptions(height, width, "Certificates", "Download your volunteer certificates"),
              profileOptions(height, width, "Notifications", "Manage notifications"),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "Payments",
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              profileOptions(height, width, "Payment methods", "Manage payment methods"),
              profileOptions(height, width, "Payment history", "View history of payments made"),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "Support",
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "About us",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.022,
                    color: Color(0xff191919)),
              ),
              Divider(
                color: Color(0xff6A6A6A),
              ),
              Text(
                "Privacy policy",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.022,
                    color: Color(0xff191919)),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget profileOptions(double height, double width, String title, String subtitle) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: height * 0.005),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.022,
                      color: Color(0xff191919)),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.02,
                      color: Color(0xff191919)),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        Divider(
          color: Color(0xff6A6A6A),
        )
      ],
    ),
  );
}
