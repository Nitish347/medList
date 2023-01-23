import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawer(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  return Drawer(
    backgroundColor: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://st2.depositphotos.com/1662991/8837/i/450/depositphotos_88370500-stock-photo-mechanic-wearing-overalls.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(40)),
                    )),
                Text(
                  "Nitish Chuarasiya",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: const Icon(
            Icons.hourglass_bottom,
            color: Colors.deepOrange,
            size: 28,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '12 Days',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                'Remaining',
                style: GoogleFonts.poppins(fontSize: 12),
              )
            ],
          ),
        ),
        Container(
          color: Colors.green,
          height: 1,
          width: double.infinity,
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.indigo,
            size: 28,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Name',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                "Shivika Tyagi",
                style: GoogleFonts.poppins(fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.green,
          height: 1,
          width: double.infinity,
        ),
        ListTile(
          leading: const Icon(
            Icons.add,
            color: Colors.green,
            size: 30,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hospital Name',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                "Ajay Kumar Garag Engineering College",
                style: GoogleFonts.poppins(fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.green,
          height: 1,
          width: double.infinity,
        ),
        ListTile(
          leading: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 28,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hospital Address',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                "Ghaziabad, Uttar Pradesh",
                style: GoogleFonts.poppins(fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.green,
          height: 1,
          width: double.infinity,
        ),
        ListTile(
          leading: const Icon(
            Icons.phone,
            color: Colors.teal,
            size: 28,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hospital Contact No.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                "8840867665",
                style: GoogleFonts.poppins(fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.green,
          height: 1,
          width: double.infinity,
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Emergency Call",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
