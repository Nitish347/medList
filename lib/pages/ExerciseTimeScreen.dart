import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.pinkAccent.withOpacity(0.9),
          centerTitle: true,
          title: Text(
            "Exercise Time",
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
              child: Lottie.asset("assets/lottie/yoga.json"),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(exercise.length, (index) {
                  return MedicineTimeTile(
                    color: Colors.pinkAccent.withOpacity(0.9),
                    index: index,
                    activeColor: Colors.pink.withOpacity(0.4),
                    thumbColor: Colors.pink,
                    trackColor: Colors.grey.withOpacity(0.5),
                    timing: timing[index],
                    title: exercise[index],
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
