import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Providers/DataProvider.dart';
import '../Providers/UserProvider.dart';
import '../models/medicine_model.dart';

class SaveUser {
  static saveUser(
    BuildContext context,
    String uid,
  ) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(provider.selectedHospital)
        .collection("Users")
        .doc(uid)
        .set({
      "Name": provider.UserName,
      "HospitalName": provider.selectedHospital,
      "PhoneNumber": provider.UserPhoneNumber,
      "uid": uid
    });
    await FirebaseFirestore.instance.collection("Users").doc(uid).set({
      "Name": provider.UserName,
      "HospitalName": provider.selectedHospital,
      "PhoneNumber": provider.UserPhoneNumber,
      "uid": uid
    });
  }
}
