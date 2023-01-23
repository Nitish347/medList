import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medlist/pages/DietPlanScreen.dart';
import 'package:medlist/pages/MedicineTimeScreen.dart';
import 'package:medlist/pages/auth/login.dart';
import 'package:medlist/pages/home.dart';
import 'package:medlist/pages/optionScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
