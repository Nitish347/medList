import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/Providers/UserProvider.dart';
import 'package:medlist/alarm_helper.dart';
import 'package:medlist/db/sqflite.dart';
import 'package:medlist/models/alarm_info.dart';
import 'package:medlist/models/exercise_model.dart';
import 'package:medlist/models/hospital_model.dart';
import 'package:medlist/models/medicine_model.dart';
import 'package:medlist/models/pastMedicine_model.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class FirestoreData {
  //*********************Medicine Data
  static medicinesData(BuildContext context) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc("Delhi Aims")
        .collection("Users")
        .doc("MBD6ejDLY8eaPm1pFLWC9gNaD2E2")
        .collection("Medicines")
        .get();
    List<MedicineModel> list = [];
    print(snap.docs[0].data()["medicines"]);
    // print(snap.docs[0].data()["medicines"]);
    for (var data in snap.docs[0].data()["medicines"]) {
      // Map<String, dynamic> data = queryDocumentSnapshot.data();
      print(data);
      MedicineModel medicineModel = MedicineModel.fromMap(data);
      // AlarmInfo medicineModel = AlarmInfo.fromMap(data);
      MedicineSave().insertAlarm(medicineModel, context);
      // AlarmHelper().insertAlarm(medicineModel);
      // list.add(medicineModel);
    }

    // provider.medicinesListUpdate(list);
    print(list);
  }

  //******************User Data
  static userData(BuildContext context) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc("HospitalName")
        .collection("Patients")
        .doc("uid1")
        .get();
    User _user = User.fromJson(snap.data() as Map<String, dynamic>);
    provider.updateUser(_user);
  }

  //***************** Exercise Data
  static exerciseData(BuildContext context) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc("HospitalName")
        .collection("Patients")
        .doc("uid1")
        .collection("Exercises")
        .get();
    List<ExerciseModel> list = [];
    for (var queryDocumentSnapshot in snap.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      ExerciseModel exerciseModel = ExerciseModel.fromJson(data);
      list.add(exerciseModel);
    }
    provider.exerciseListUpdate(list);
  }

  //***************** Past Medicine Data
  static pastMedicineData(BuildContext context) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc("HospitalName")
        .collection("Patients")
        .doc("uid1")
        .collection("PastMedicines")
        .get();
    List<PastMedicineModel> list = [];
    for (var queryDocumentSnapshot in snap.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      PastMedicineModel pastMedicineModel = PastMedicineModel.fromJson(data);
      list.add(pastMedicineModel);
    }
    provider.pastMedicineListUpdate(list);
  }

  //***************** Hospital Data
  static hospitalData(BuildContext context, String uid) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    print("fetching");
    var snp =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    String hsptlName = snp.data()!["HospitalName"];
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(hsptlName)
        .get();
    HospitalModel hospitalModel = HospitalModel.fromJson(snap.data()!);
    provider.updateHopital(hospitalModel);
  }

  //******************** Hospital Names List
  static HospitalNamesList(BuildContext context) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    List<String> list = [];
    final querySnap =
        await FirebaseFirestore.instance.collection('HospitalNames').get();

    for (var i = 0; i < querySnap.docs.length; i++) {
      final data = querySnap.docs[i].id;
      list.add(data);
    }

    print(list);
    provider.updateHospitalNames(list);
  }
}
