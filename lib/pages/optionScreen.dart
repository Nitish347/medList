import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/grid.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  int optionSelected = 0;
  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  List<String> lotties = ['assets/lottie/note.json', 'assets/lottie/note.json'];

  @override
  Widget build(BuildContext context) {
    List<String> name = ["Patient", "Staff"];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('doctor.json'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Choose what you are :- ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: GridView.count(
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
                          onTap: () => checkOption(i + 1),
                          selected: i + 1 == optionSelected,
                        )
                    ]),
              ),
            ),
          ],
        ));
  }
}
