import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:medlist/models/alarm_info.dart';
import 'package:medlist/widgets/medicineTimeTile.dart';

import '../alarm_helper.dart';
import '../main.dart';

class MedicineTimeScreen extends StatefulWidget {
  const MedicineTimeScreen({Key? key}) : super(key: key);

  @override
  State<MedicineTimeScreen> createState() => _MedicineTimeScreenState();
}

class _MedicineTimeScreenState extends State<MedicineTimeScreen> {
  bool status = false;
  DateTime? _alarmTime;
  late String _alarmTimeString;
  bool _isRepeatSelected = false;
  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;
  List<AlarmInfo> _currentAlarms = [
    AlarmInfo(
        title: "Nitishhhhh",
        alarmDateTime: DateTime.now().add(Duration(seconds: 5))),
  ];

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms();
    print(_alarms);
    if (mounted) setState(() {});
  }
  //*****************************************************************************

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo,
      {required bool isRepeating}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.max, importance: Importance.max);

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    if (isRepeating) {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Office',
        alarmInfo.title,
        Time(
          scheduledNotificationDateTime.hour,
          scheduledNotificationDateTime.minute,
          scheduledNotificationDateTime.second,
        ),
        platformChannelSpecifics,
      );
    } else {
      await flutterLocalNotificationsPlugin.schedule(0, "title", "body",
          scheduledNotificationDateTime, platformChannelSpecifics);
    }
  }

  //*********************************************************************************
  void onSaveAlarm(bool _isRepeating) {
    _alarmTime = _currentAlarms[0].alarmDateTime;
    DateTime? scheduleAlarmDateTime;
    if (_alarmTime!.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime!.add(Duration(days: 1));

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      title: 'alarm',
    );
    _alarmHelper.insertAlarm(alarmInfo);
    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo,
          isRepeating: _isRepeating);
    }
    loadAlarms();
  }

  void deleteAlarm(int? id) {
    _alarmHelper.delete(id);
    //unsubscribe for notification
    loadAlarms();
  }

  List<String> medicines = [
    "Augmentin 625 Duo Tablet",
    "Allegra 120mg Tablet",
    "Azee 500 Tablet",
    "Alex Syrup",
    "Augmentin 625 Duo Tablet",
    "Allegra 120mg Tablet",
    "Azee 500 Tablet",
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
  void initState() {
    // TODO: implement initState
    onSaveAlarm(false);
    loadAlarms();
    // deleteAlarm(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          title: Text(
            "Medicine Time",
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
              Container(
                height: height / 4,
                child: Lottie.asset("assets/lottie/medicine.json"),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Column(
                    children: List.generate(_currentAlarms.length, (index) {
                  return MedicineTimeTile(
                    trackColor: Colors.grey,
                    thumbColor: Colors.blue.shade700,
                    activeColor: Colors.blue.withOpacity(0.5),
                    color: Colors.blue.shade700,
                    index: index,
                    title: _currentAlarms[index].title!,
                    timing: DateFormat.Hms()
                        .format(_currentAlarms[index].alarmDateTime!)
                        .toString(),
                  );
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
