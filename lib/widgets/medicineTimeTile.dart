import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineTimeTile extends StatefulWidget {
  int index;
  String title;
  String timing;
  Color color;
  Color activeColor;
  Color thumbColor;
  Color trackColor;
  MedicineTimeTile(
      {required this.index,
      required this.activeColor,
      required this.thumbColor,
      required this.trackColor,
      required this.title,
      required this.timing,
      required this.color});

  @override
  State<MedicineTimeTile> createState() => _MedicineTimeTileState();
}

class _MedicineTimeTileState extends State<MedicineTimeTile> {
  bool status = true;

  List<String> medicines = [
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
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: widget.color, blurRadius: 2)],
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.index + 1}. ${widget.title}",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: widget.color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        activeColor: widget.activeColor,
                        thumbColor: widget.thumbColor,
                        trackColor: widget.trackColor,
                        value: status,
                        onChanged: (value) => setState(() {
                          status = value;
                          print(widget.title);
                        }),
                      ),
                      Text(
                        widget.timing.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: widget.color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                  collapsedIconColor: widget.color,
                  collapsedTextColor: widget.color,
                  textColor: widget.color,
                  iconColor: widget.color,
                  collapsedBackgroundColor: Colors.white12,
                  children: [Image.asset("assets/images/medlist.png")],
                  title: Text("Medicine Picture"),
                  subtitle: Text("Touch to expand"),
                  backgroundColor: Colors.white12),
            ],
          ),
        )
        // Neumorphic(
        //     style: NeumorphicStyle(
        //         shape: NeumorphicShape.concave,
        //         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        //         depth: 8,
        //         lightSource: LightSource.top,
        //         color: Colors.white10),
        //     child: Container(
        //       alignment: Alignment.center,
        //       padding: EdgeInsets.all(10),
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           boxShadow: [BoxShadow(color: widget.color, blurRadius: 2)],
        //           borderRadius: BorderRadius.circular(7)),
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Expanded(
        //                 child: Text(
        //                   "${widget.index + 1}. ${widget.title}",
        //                   style: GoogleFonts.poppins(
        //                     fontSize: 20,
        //                     color: widget.color,
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //               ),
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   CupertinoSwitch(
        //                     activeColor: widget.activeColor,
        //                     thumbColor: widget.thumbColor,
        //                     trackColor: widget.trackColor,
        //                     value: status,
        //                     onChanged: (value) => setState(() {
        //                       status = value;
        //                       print(widget.title);
        //                     }),
        //                   ),
        //                   Text(
        //                     widget.timing.toString(),
        //                     style: GoogleFonts.poppins(
        //                       fontSize: 12,
        //                       color: widget.color,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //           ExpansionTile(
        //               collapsedIconColor: widget.color,
        //               collapsedTextColor: widget.color,
        //               textColor: widget.color,
        //               iconColor: widget.color,
        //               collapsedBackgroundColor: Colors.white12,
        //               children: [Image.asset("assets/images/medlist.png")],
        //               title: Text("Medicine Picture"),
        //               subtitle: Text("Touch to expand"),
        //               backgroundColor: Colors.white12),
        //         ],
        //       ),
        //     )),
        );
  }
}
