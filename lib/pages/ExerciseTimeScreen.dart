import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/medicineTimeTile.dart';

class ExerciseTimeScreen extends StatefulWidget {
  @override
  State<ExerciseTimeScreen> createState() => _ExerciseTimeScreenState();
}

class _ExerciseTimeScreenState extends State<ExerciseTimeScreen> {
  bool status = false;
  List<String> exercise = [
    "Paracetamol",
    "Crocin",
    "Crocin Advance",
    "Crocin Advance",
    "Crocin Advance",
    "Crocin Advance",
    "Crocin Advane",
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
    var provider = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        centerTitle: true,
        title: Text(
          "Exercise Time",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.white,
              shadows: [const BoxShadow(color: Colors.black, blurRadius: 5)]),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height / 4,
              child: Lottie.asset("assets/lottie/yoga.json"),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                  children:
                      List.generate(provider.exerciseList!.length, (index) {
                return MedicineTimeTile(
                  color: Colors.redAccent.withOpacity(0.9),
                  index: index,
                  activeColor: Colors.redAccent.withOpacity(0.4),
                  thumbColor: Colors.redAccent,
                  trackColor: Colors.grey.withOpacity(0.5),
                  title: provider.exerciseList![index].title!,
                  timing: DateFormat.jm()
                      .format(provider.exerciseList![index].alarmDateTime!)
                      .toString(),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
