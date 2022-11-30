import 'package:flutter/material.dart';

class Try extends StatefulWidget {
  const Try({Key? key}) : super(key: key);

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExpansionTile(
            collapsedIconColor: Colors.red,
            collapsedBackgroundColor: Colors.amber,
            children: [Image.asset("assets/images/medlist.png")],
            title: Text("nitish"),
            backgroundColor: Colors.white12),
      ),
    );
  }
}
