import 'package:flutter/cupertino.dart';
import 'package:medlist/models/hospital_model.dart';
import 'package:medlist/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? user;
  HospitalModel hospitalModel = HospitalModel(
      HospitalName: "null",
      HospitalContact: "null",
      HospitalAddress: "null",
      DrName: "null");
  List<String> hospitalNames = [];
  String selectedHospital = 'Select Your Hospital';
  String UserName = 'Select Your Hospital';
  String UserPhoneNumber = '';

  void updateUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void updateHopital(HospitalModel hospitalModel) {
    this.hospitalModel = hospitalModel;
    notifyListeners();
  }

  void updateHospitalNames(List<String> hospitalNames) {
    this.hospitalNames = hospitalNames;
    notifyListeners();
  }
}
