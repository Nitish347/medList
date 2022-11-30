import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/widgets/medicineTimeTile.dart';

class MedicineTimeScreen extends StatefulWidget {
  const MedicineTimeScreen({Key? key}) : super(key: key);

  @override
  State<MedicineTimeScreen> createState() => _MedicineTimeScreenState();
}

class _MedicineTimeScreenState extends State<MedicineTimeScreen> {
  bool status = false;
  List<String> medicines = [
    "Augmentin 625 Duo Tablet",
    "Allegra 120mg Tablet",
    "Azee 500 Tablet",
    "Alex Syrup",
    "Augmentin 625 Duo Tablet",
    "Allegra 120mg Tablet",
    "Azee 500 Tablet",
  ];
  List<String> timing = [
    "12:30 pm",
    "08:00 pm",
    "11:00 pm",
    "11:00 pm",
    "11:00 pm",
    "11:00 pm",
    "11:00 pm"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          title: Text(
            "Medicine Time",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Colors.white,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 5)]),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height / 4,
              child: Lottie.asset("assets/lottie/medicine.json"),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(medicines.length, (index) {
                  return MedicineTimeTile(
                    trackColor: Colors.grey,
                    thumbColor: Colors.blue.shade700,
                    activeColor: Colors.blue.withOpacity(0.5),
                    color: Colors.blue.shade700,
                    index: index,
                    title: medicines[index],
                    timing: timing[index],
                  );
                })),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
