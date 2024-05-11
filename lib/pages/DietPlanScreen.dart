import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/medicineTimeTile.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent[200],
        centerTitle: true,
        title: Text(
          "Diet Plan",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black, blurRadius: 5)]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 5,
              color: Colors.white,
              child: Lottie.asset('assets/lottie/diet.json'),
            ),
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
                          "What to Eat",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        for (int i = 0; i < provider.dietPlan!.eat!.length; i++)
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
                                  provider.dietPlan!.eat![i],
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
            ),
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
                          "What to Avoid",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        for (int i = 0; i < provider.dietPlan!.avoid!.length; i++)
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
                                  provider.dietPlan!.avoid![i],
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          )
                        // for (int i = 0;
                        //     i < provider.dietPlan!.notEat!.length;
                        //     i++)
                        //   Container(
                        //     padding: EdgeInsets.all(10),
                        //     alignment: Alignment.centerLeft,
                        //     child: Row(
                        //       children: [
                        //         Text(
                        //           "${i + 1}.",
                        //           style: TextStyle(
                        //               fontSize: 19,
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         Text(
                        //           provider.dietPlan!.notEat![i],
                        //           style: TextStyle(fontSize: 17),
                        //         )
                        //       ],
                        //     ),
                        //   )
                      ],
                    ),
                  )),

          ],
        ),
      ),
    );
  }
}
