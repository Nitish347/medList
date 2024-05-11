import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/widgets/appbar.dart';

class PastMedicines extends StatefulWidget {
  const PastMedicines({Key? key}) : super(key: key);

  @override
  State<PastMedicines> createState() => _PastMedicinesState();
}

class _PastMedicinesState extends State<PastMedicines> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    List dateList = [
      "11/Nov/22",
      "01/Nov/22",
      "21/Oct/22",
      "15/Sep/22",
    ];
    List MedicineList = [
      "Augmentin 625 Duo Tablet",
      "Allegra 120mg Tablet",
      "Azee 500 Tablet",
      "Alex Syrup",
      "Augmentin 625 Duo Tablet",
      "Allegra 120mg Tablet",
      "Azee 500 Tablet",
      "Alex Syrup",
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.green.withOpacity(0.9),
        centerTitle: true,
        title: Text(
          "Past Medicines",
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
          children: [
            Container(
              height: height / 5,
              color: Colors.white,
              child: Lottie.asset('assets/lottie/medicines list.json'),
            ),
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.all(18.0),
                child:
                // Neumorphic(
                //     style: NeumorphicStyle(
                //         shape: NeumorphicShape.concave,
                //         boxShape: NeumorphicBoxShape.roundRect(
                //             BorderRadius.circular(12)),
                //         depth: 8,
                //         lightSource: LightSource.topLeft,
                //         color: Colors.white54),
                //     child:
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            dateList[i],
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          for (int i = 0; i < 8; i++)
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "${i + 1}.",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    MedicineList[i],
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    )),

          ],
        ),
      ),
    );
  }
}
