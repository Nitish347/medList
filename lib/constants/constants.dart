import 'dart:ui';
import 'package:flutter/material.dart';

class Constants {
  static final neumorphic1 = [
    BoxShadow(
      color: Colors.white.withOpacity(0.5),
      blurRadius: 10.0,
    ),
    BoxShadow(color: Colors.black12, offset: Offset(4.0, 4.0), blurRadius: 10.0)
  ];
  static final neumorphic2 = [
    BoxShadow(
      color: Colors.green.withOpacity(0.9),
      blurRadius: 10.0,
    ),
    BoxShadow(color: Colors.green.withOpacity(0.6), offset: Offset(4.0, 4.0), blurRadius: 10.0)
  ];
  static final purplegradient = LinearGradient(colors: [
    Color.fromRGBO(143, 148, 251, 1),
    Color.fromRGBO(143, 148, 251, .6),
  ]);
  static final purplegradient1 = LinearGradient(colors: [Colors.white, Colors.white]);
}

final green1 = Color(0xff054A29);
final green2 = Color(0xff137547);
final green3 = Color(0xff2A9134);
final green4 = Color(0xff3FA34D);
final green5 = Color(0xff5BBA6F);
final green6 = Color(0xffB7EFC5);
