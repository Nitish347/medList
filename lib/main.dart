import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/Providers/UserProvider.dart';
import 'package:medlist/pages/DietPlanScreen.dart';
import 'package:medlist/pages/MedicineTimeScreen.dart';
import 'package:medlist/pages/auth/Register.dart';
import 'package:medlist/pages/auth/login.dart';
import 'package:medlist/pages/auth/verify.dart';

import 'package:medlist/pages/home.dart';
import 'package:medlist/pages/login/login_screen.dart';
import 'package:medlist/pages/optionScreen.dart';
import 'package:medlist/widgets/bottombar.dart';
import 'package:provider/provider.dart';

// import 'Notifications/noti.dart';
import 'package:flutter/material.dart';

import 'ChatMessagesModel.dart';
import 'global_members.dart';
import 'widgets/sender_row_view.dart';

var url = 'https://i.pinimg.com/736x/fd/6e/04/fd6e04548095d7f767917f344a904ff1.jpg';
var urlTwo = 'https://sguru.org/wp-content/uploads/2017/03/cute-n-stylish-boys-fb-dp-2016.jpg';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings = InitializationSettings(android: androidSettings);
  bool? initialized = await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  log("Notification : $initialized");

  // await Hive.initFlutter();
  // var box = await Hive.openBox('mybox');
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider())
    ],
    child:GetMaterialApp(
          title: 'Flutter Demo',
          showSemanticsDebugger: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return HomeScreen(uid: FirebaseAuth.instance.currentUser!.uid.toString());
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
                return BottomBar();
              })
    ));
  }
}
