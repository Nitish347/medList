import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Providers/UserProvider.dart';
import 'package:medlist/models/hospital_model.dart';
import 'package:provider/provider.dart';

Widget drawer(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var provider = Provider.of<UserProvider>(context, listen: false);
  return Drawer(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(0))),
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
                  style: GoogleFonts.alice(
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
                provider.hospitalModel.DrName.toString(),
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
                provider.hospitalModel.HospitalName.toString(),
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
                provider.hospitalModel.HospitalAddress.toString(),
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
                provider.hospitalModel.HospitalContact.toString(),
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
          height: 30,
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Book Appointment",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Emergency Call",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
