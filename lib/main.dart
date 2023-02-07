import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/Providers/UserProvider.dart';
import 'package:medlist/pages/DietPlanScreen.dart';
import 'package:medlist/pages/MedicineTimeScreen.dart';
import 'package:medlist/pages/auth/login.dart';
import 'package:medlist/pages/home.dart';
import 'package:medlist/pages/optionScreen.dart';
import 'package:provider/provider.dart';

import 'Notifications/noti.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings);
  bool? initialized =
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  log("Notification : $initialized");

  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return HomeScreen(
                        uid: FirebaseAuth.instance.currentUser!.uid.toString());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return LoginPage();
              })),
    );
  }
}
