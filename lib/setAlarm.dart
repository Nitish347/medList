import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medlist/models/exercise_model.dart';
import 'package:medlist/models/medicine_model.dart';

import 'main.dart';
import 'models/alarm_info.dart';
import 'package:http/http.dart' as http;

class SetAlarm {
  void ScheduleAlarm(DateTime scheduleAlarmDateTime, MedicineModel alarmInfo,
      {required bool isRepeating}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      "channelId",
      "channelName",
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('a_long_cold_string'),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    print(scheduleAlarmDateTime);
    await flutterLocalNotificationsPlugin.schedule(
        alarmInfo.id!,
        "Exercise Name : ",
        alarmInfo.title,
        scheduleAlarmDateTime,
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

  void cancelNoti(int id) async {
    // cancel the notification with id value of zero
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  void cancelAllNoti() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

//**********************************************************************************
// void loadAlarms(BuildContext context) {
//   // _alarms = MedicineSave().getAlarms(context);
//   // print(_alarms![0]);
//   if (mounted) setState(() {});
// }

}
