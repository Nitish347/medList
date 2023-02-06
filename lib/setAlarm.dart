import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlist/models/medicine_model.dart';

import 'main.dart';
import 'models/alarm_info.dart';
import 'package:http/http.dart' as http;

class SetAlarm {
  void ScheduleAlarm(DateTime scheduleAlarmDateTime, MedicineModel alarmInfo,
      {required bool isRepeating}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.max,
            importance: Importance.max,
            playSound: true,
            styleInformation: BigPictureStyleInformation(
                FilePathAndroidBitmap("assets/images/medlist.png")),
            sound: RawResourceAndroidNotificationSound('noti'));

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    print(scheduleAlarmDateTime);
    await flutterLocalNotificationsPlugin.schedule(
        alarmInfo.id!,
        "Medicine Name : ",
        alarmInfo.title,
        DateTime.now().add(Duration(seconds: 3)),
        platformChannelSpecifics);
  }

  //**********************************************************************************************

  void onSaveAlarm(bool _isRepeating, DateTime time, MedicineModel alarmInfo) {
    DateTime? scheduleAlarmDateTime;
    if (time.isAfter(DateTime.now()))
      scheduleAlarmDateTime = time;
    else
      scheduleAlarmDateTime = time.add(Duration(days: 1));

    if (scheduleAlarmDateTime != null) {
      ScheduleAlarm(scheduleAlarmDateTime, alarmInfo,
          isRepeating: _isRepeating);
    }
    // loadAlarms(context);
  }

  //**********************************************************************************
  // void loadAlarms(BuildContext context) {
  //   // _alarms = MedicineSave().getAlarms(context);
  //   // print(_alarms![0]);
  //   if (mounted) setState(() {});
  // }

}
