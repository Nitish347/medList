import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:medlist/models/hospital_model.dart';

class ReadHive {
  final mybox = Hive.box('mybox');

  HospitalModel hospitalRead() {
    String data = mybox.get('hModel');
    print(data);
    Map<String, dynamic> Jdata = jsonDecode(data);
    print(Jdata["HospitalAdrress"]);
    HospitalModel hospitalModel = HospitalModel.fromJson(Jdata);

    return hospitalModel;
  }
  //
  // void loggedInStatus() {
  //   String data = mybox.get("logged");
  //   if (data != null) print(data);
  // }
}
