import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../widgets/grid.dart';

class PastReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> li = ["X-Ray", "Blood Test", "M.R.I.", "Liver Test"];
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(
          "Past Reports",
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
            // SizedBox(
            //   height: height / 50,
            // ),
            Center(
              child: Container(
                height: height / 6,
                child: Lottie.asset("assets/lottie/note.json"),
              ),
            ),
            SizedBox(
              height: 10,
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
                        for (int i = 0; i < 4; i++)
                          grid(
                            branch: li[i],
                            images: "assets/lottie/note.json",
                            // onTap: () => checkOption(i),
                            // selected: i + 1 == optionSelected,
                          )
                      ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
