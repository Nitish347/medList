import 'dart:async';
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Hive/readHive.dart';
import 'package:medlist/Hive/writeData.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/alarm_helper.dart';
import 'package:medlist/controllers/prescription_controller.dart';
import 'package:medlist/controllers/user_controller.dart';
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
import '../chat.dart';
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
        Navigator.push(context, CupertinoPageRoute(builder: (context) => MedicineTimeScreen()));
        break;
      case 1:
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ExerciseTimeScreen()));
        break;
      case 4:
        Navigator.push(context, CupertinoPageRoute(builder: (context) => PastMedicines()));
        break;
      case 5:
        Navigator.push(context, CupertinoPageRoute(builder: (context) => PastReport()));
        break;
    }
  }

  List<String> name = [
    'Medicines Time',
    'Exercise time',
    'Diet\nPLan',
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
    loadData();
    super.initState();
    // _alarmHelper.initializeDatabase().then((value) {
    //   print("*******************ho gyaa");
    // });

    // MedicineSave().getAlarms(context);
    super.initState();
    _remainingSeconds = 200;
    _startTimer(4000);

    // loading();
    // read();
  }
  final userController = Get.put(UserController());
  final presController = Get.put(PrescriptionController());
  bool _loading = false;
loadData()async{
  setState(() {
    _loading = true;
  });
  await userController.getUser();
  await presController.getMedicines();
    setState(() {
      _loading = false;
    });
}
  void _calculateTime(int totalSeconds) {
    _remainingHours = totalSeconds ~/ 3600;
    _remainingMinutes = (totalSeconds % 3600) ~/ 60;
    _remainingSeconds = totalSeconds % 60;
  }

  void _startTimer(int sec) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec > 0) {
        setState(() {
          sec--;
          _calculateTime(sec);
        });
      } else {
        _timer.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }

  late Timer _timer;
  int _remainingHours = 0;
  int _remainingMinutes = 0;
  int _remainingSeconds = 0;
  String nameUser = "";
  //
  // void loading() async {
  //   await FirestoreData.userData(context, widget.uid);
  //
  //   var namee = await FirebaseFirestore.instance.collection("Users").doc(widget.uid).get();
  //   setState(() {
  //     nameUser = namee["Name"];
  //   });
  //
  //   await FirestoreData.hospitalData(context, widget.uid);
  //   await FirestoreData.medicinesData(context, widget.uid);
  //   await FirestoreData.exerciseData(context, widget.uid);
  //   await FirestoreData.dietPlan(context, widget.uid);
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    var provider = Provider.of<UserProvider>(context, listen: false);
    var provider1 = Provider.of<DataProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("object");
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyChatUI()));
          },
          child: Icon(Icons.chat),
        ),
        drawer: drawer(context),
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          // leading: Icon(
          //   Icons.menu,
          //   color: green1,
          //   size: height * 0.035,
          // ),
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
                    SetAlarm().onSaveAlarm(false, provider1.medicinesList![i].alarmDateTime!,
                        provider1.medicinesList![i]);
                  }
                  for (int i = 0; i < list1.length; i++) {
                    SetAlarm1().onSaveAlarm(false, provider1.exerciseList![i].alarmDateTime!,
                        provider1.exerciseList![i]);
                  }
                },
                icon: Icon(
                  CupertinoIcons.refresh,
                  color: green1,
                ))
          ],
          toolbarHeight: height * 0.06,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     bottom: Radius.circular(30),
          //   ),
          // ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          // title: Text(
          //   "Med-List",
          //   style: GoogleFonts.poppins(
          //     fontWeight: FontWeight.w400,
          //     fontSize: height * 0.03,
          //     color: green1,
          //   ),
          // ),
        ),
        backgroundColor: Colors.white,
        body:  _loading ? Center(child: LoadingAnimationWidget.fourRotatingDots(color: green1, size: height*0.04),)  :     SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widht * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CarouselSlider(
                //   options: CarouselOptions(
                //       onPageChanged: (index, reason) {
                //         setState(() {
                //           activeIndex_Carousal = index;
                //         });
                //       },
                //       disableCenter: true,
                //       initialPage: 0,
                //       height: 160.0,
                //       autoPlay: true,
                //       autoPlayInterval: Duration(seconds: 3)),
                //   items: [1, 2, 3, 4, 5].map((i) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8),
                //           child: Container(
                //             width: 280,
                //             decoration: BoxDecoration(
                //                 // boxShadow: Constants.neumorphic2,
                //                 image: DecorationImage(
                //                     image: AssetImage("assets/images/medicine.jpg"),
                //                     fit: BoxFit.fill),
                //                 borderRadius: BorderRadius.circular(10),
                //                 color: Colors.white),
                //           ),
                //         );
                //       },
                //     );
                //   }).toList(),
                // ),

                // SizedBox(
                //   height: 5,
                // ),
                // buildIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        "Hello\n${userController.userModel.value.patientName}!",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.04,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Center(
                      child: AvatarGlow(
                        glowColor: Colors.green,
                        glowRadiusFactor: 0.25,
                        // endRadius: 90.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        // showTwoGlows: true,
                        // repeatPauseDuration: Duration(milliseconds: 100),
                        child: Material(
                          // Replace this child with your own
                          elevation: 15.0,
                          shape: CircleBorder(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                // image
                                radius: height * 0.04), // circleAvatar
                          ), // ClipRRect
                        ), // Material
                      ), // avatarglow
                    )
                  ],
                ),
                SizedBox(
                  width: widht,
                  child: Text(
                    "Welcome to the Med-List",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.025,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                nextMedicine(height, widht),
                Container(
                  margin: EdgeInsets.all(20),
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
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
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => DietPlanScreen())),
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
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: green2,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          topLeft: Radius.circular(15))),
                                  child: Text(
                                    name[2],
                                    style: GoogleFonts.poppins(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: widht * 0.7,
                                child: Lottie.asset(lotties[2]),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
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
      ),
    );
  }

  String _formatTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }

  Widget nextMedicine(double height, double width) {
    return Container(
      width: width,
      height: height * 0.1,
      decoration: BoxDecoration(color: green6, borderRadius: BorderRadius.circular(height * 0.1)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.08,
              width: height * 0.08,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: green5, borderRadius: BorderRadius.circular(height * 0.1)),
              child: FaIcon(
                FontAwesomeIcons.houseMedical,
                color: Colors.white,
                size: height * 0.03,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Next Medicine",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                      color: green1,
                    ),
                  ),
                  Container(
                    height: height * 0.045,
                    width: width * 0.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(height * 0.1)),
                    child: FittedBox(
                      child: Text(
                        '$_remainingHours:${_formatTime(_remainingMinutes)}:${_formatTime(_remainingSeconds)}',
                        style: GoogleFonts.poppins(color: green2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.08,
              width: height * 0.08,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(height * 0.1)),
              child: FaIcon(
                FontAwesomeIcons.forward,
                color: green3,
                size: height * 0.035,
              ),
            ),
          ],
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
