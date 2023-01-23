import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/pages/DietPlanScreen.dart';
import 'package:medlist/pages/ExerciseTimeScreen.dart';
import 'package:medlist/pages/MedicineTimeScreen.dart';
import 'package:medlist/pages/PastMedicines.dart';
import 'package:medlist/pages/PastReport.dart';
import 'package:medlist/widgets/drawer.dart';

import '../constants/constants.dart';
import '../widgets/grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int optionSelected = 0;
  void checkOption(int index) {
    print(index);
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MedicineTimeScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExerciseTimeScreen()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PastMedicines()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PastReport()));
        break;
    }
  }

  List<String> name = [
    'Medicines Time',
    'Exercise time',
    'Diet PLan',
    'Past Medicines',
    '  Past Report'
  ];
  List<String> lotties = [
    'assets/lottie/medicine.json',
    'assets/lottie/yoga.json',
    'assets/lottie/diet.json',
    'assets/lottie/medicines list.json',
    'assets/lottie/note.json',
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
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
            "MedList",
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
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 7,
              width: widht / 2.5,
              // color: Colors.black,
              child: Image.asset('assets/images/medlist.png'),
            ),
            SizedBox(
              height: height / 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 30,
                      ),
                      GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          children: [
                            for (int i = 0; i < 2; i++)
                              grid(
                                branch: name[i],
                                images: lotties[i],
                                onTap: () => checkOption(i),
                                selected: i + 1 == optionSelected,
                              )
                          ]),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietPlanScreen())),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: Constants.neumorphic1,
                              borderRadius: BorderRadius.circular(15),
                              gradient: Constants.purplegradient1),
                          width: widht,
                          height: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                name[2],
                                style: GoogleFonts.alice(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                child: Lottie.asset(lotties[2]),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          children: [
                            for (int i = 3; i < 5; i++)
                              grid(
                                branch: name[i],
                                images: lotties[i],
                                onTap: () => checkOption(i + 1),
                                selected: i + 1 == optionSelected,
                              )
                          ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
