import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Hive/readHive.dart';
import 'package:medlist/Hive/writeData.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/alarm_helper.dart';
import 'package:medlist/db/sqflite.dart';
import 'package:medlist/models/hospital_model.dart';
import 'package:medlist/pages/DietPlanScreen.dart';
import 'package:medlist/pages/ExerciseTimeScreen.dart';
import 'package:medlist/pages/MedicineTimeScreen.dart';
import 'package:medlist/pages/PastMedicines.dart';
import 'package:medlist/pages/PastReport.dart';
import 'package:medlist/setAlarm.dart';
import 'package:medlist/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Providers/UserProvider.dart';
import '../constants/constants.dart';
import '../setAlarmExercise.dart';
import '../widgets/grid.dart';

class HomeScreen extends StatefulWidget {
  String uid;
  HomeScreen({required this.uid});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int optionSelected = 0;
  int activeIndex_Carousal = 0;
  int activeIndex_tabs = 0;
  void checkOption(int index) {
    print(index);
    switch (index) {
      case 0:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => MedicineTimeScreen()));
        break;
      case 1:
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => ExerciseTimeScreen()));
        break;
      case 4:
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => PastMedicines()));
        break;
      case 5:
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => PastReport()));
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
  AlarmHelper _alarmHelper = AlarmHelper();

  @override
  void initState() {
    super.initState();
    // _alarmHelper.initializeDatabase().then((value) {
    //   print("*******************ho gyaa");
    // });

    // MedicineSave().getAlarms(context);
    loading();
    // read();
  }

  String nameUser = "";

  void loading() async {
    await FirestoreData.userData(context, widget.uid);

    var namee = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.uid)
        .get();
    setState(() {
      nameUser = namee["Name"];
    });

    await FirestoreData.hospitalData(context, widget.uid);
    await FirestoreData.medicinesData(context, widget.uid);
    await FirestoreData.exerciseData(context, widget.uid);
    await FirestoreData.dietPlan(context, widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    var provider = Provider.of<UserProvider>(context, listen: false);
    var provider1 = Provider.of<DataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        drawer: drawer(context, nameUser),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  SetAlarm().cancelAllNoti();
                  FirestoreData.dietPlan(context, widget.uid);
                  await FirestoreData.hospitalData(context, widget.uid);
                  // await MedicineSave().deleteAll(context);
                  await FirestoreData.medicinesData(context, widget.uid);
                  await FirestoreData.exerciseData(context, widget.uid);
                  // await MedicineSave().getAlarms(context);
                  var list = provider1.medicinesList!;
                  var list1 = provider1.exerciseList!;
                  for (int i = 0; i < list.length; i++) {
                    SetAlarm().onSaveAlarm(
                        false,
                        provider1.medicinesList![i].alarmDateTime!,
                        provider1.medicinesList![i]);
                  }
                  for (int i = 0; i < list1.length; i++) {
                    SetAlarm1().onSaveAlarm(
                        false,
                        provider1.exerciseList![i].alarmDateTime!,
                        provider1.exerciseList![i]);
                  }
                },
                icon: Icon(CupertinoIcons.refresh))
          ],
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 50,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex_Carousal = index;
                      });
                    },
                    disableCenter: true,
                    initialPage: 0,
                    height: 160.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3)),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 280,
                          decoration: BoxDecoration(
                              // boxShadow: Constants.neumorphic2,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/medicine.jpg"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 5,
              ),
              buildIndicator(),
              SizedBox(
                height: height / 50,
              ),
              Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex_Carousal,
        count: 5,
        effect: ScrollingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            spacing: 4,
            activeDotColor: Colors.indigo,
            dotColor: Color(0xff707070)),
      );
}
