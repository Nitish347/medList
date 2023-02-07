import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/Providers/UserProvider.dart';

import 'package:medlist/db/sqflite.dart';
import 'package:medlist/models/dietPlan.dart';

import 'package:medlist/models/exercise_model.dart';
import 'package:medlist/models/hospital_model.dart';
import 'package:medlist/models/medicine_model.dart';
import 'package:medlist/models/pastMedicine_model.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class FirestoreData {
  //*********************Medicine Data
  static medicinesData(BuildContext context, String uid) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var provider1 = Provider.of<UserProvider>(context, listen: false);
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(provider1.user!.hospitalName)
        .collection("Users")
        .doc(uid)
        .collection("Medicines")
        .get();
    List<MedicineModel> list = [];
    print(snap.docs[0].data()["medicines"]);
    // print(snap.docs[0].data()["medicines"]);
    for (var data in snap.docs[0].data()["medicines"]) {
      print(data);
      MedicineModel medicineModel = MedicineModel.fromMap(data);
      list.add(medicineModel);
      // MedicineSave().insertAlarm(medicineModel, context);
    }

    provider.medicinesListUpdate(list);
    print(list);
  }

  //******************User Data
  static userData(BuildContext context, String uid) async {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var snp =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    // String hsptlName = snp.data()!["HospitalName"];
    // print(hsptlName);
    // print(snp.data()!["name"]);
    User _user = User.fromJson(snp.data()!);
    provider.updateUser(_user);
    print(_user.hospitalName);
  }

  //***************** Exercise Data
  static exerciseData(BuildContext context, String uid) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var provider1 = Provider.of<UserProvider>(context, listen: false);
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(provider1.user!.hospitalName)
        .collection("Users")
        .doc(uid)
        .collection("Exercises")
        .get();
    List<ExerciseModel> list = [];
    // print(snap.docs[0].data()["exercises"]);
    // print(snap.docs[0].data()["medicines"]);
    for (var data in snap.docs[0].data()["exercises"]) {
      // print(data);
      MedicineModel medicineModel = MedicineModel.fromMap(data);
      ExerciseModel exerciseModel = ExerciseModel.fromMap(data);
      list.add(exerciseModel);
      // MedicineSave().insertAlarm(medicineModel, context);
    }
    provider.exerciseListUpdate(list);
    print(provider.exerciseList);
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

  //***************** Exercise Data
  static dietPlan(BuildContext context, String uid) async {
    var provider = Provider.of<DataProvider>(context, listen: false);
    var provider1 = Provider.of<UserProvider>(context, listen: false);
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('HospitalNames')
        .doc(provider1.user!.hospitalName)
        .collection("Users")
        .doc(uid)
        .collection("DietPlan")
        .get();
    List<DietModel> list = [];
    print(snap.docs[0].data()["Deitplan"]);
    DietModel dietModel = DietModel.fromMap(snap.docs[0].data()["Deitplan"]);
    print(dietModel.eat);
    provider.dietPlanUpdate(dietModel);
    print(provider.dietPlan!.eat);
  }
}
