import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:medlist/models/hospital_model.dart';

class WriteHive {
  final mybox = Hive.box('mybox');

  void hospitalWrite(HospitalModel hospitalModel) {
    String data = jsonEncode(hospitalModel);
    print("wertyuijhgfcvb");
    print(data);
    mybox.put("hModel", data);
  }
}
