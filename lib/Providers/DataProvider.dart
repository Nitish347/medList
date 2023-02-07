import 'package:flutter/cupertino.dart';
import 'package:medlist/models/exercise_model.dart';
import 'package:medlist/models/medicine_model.dart';
import 'package:medlist/models/pastMedicine_model.dart';

import '../models/dietPlan.dart';

class DataProvider with ChangeNotifier {
  List<MedicineModel>? medicinesList;
  List<ExerciseModel>? exerciseList;
  List<PastMedicineModel>? pastMedicineList;
  DietModel? dietPlan;
  // DietModel? DietModel;

  void medicinesListUpdate(List<MedicineModel>? medicinesList) {
    this.medicinesList = medicinesList;
    notifyListeners();
  }

  void exerciseListUpdate(List<ExerciseModel>? exerciseList) {
    this.exerciseList = exerciseList;
    notifyListeners();
  }

  void pastMedicineListUpdate(List<PastMedicineModel>? pastMedicineList) {
    this.pastMedicineList = pastMedicineList;
    notifyListeners();
  }

  void dietPlanUpdate(DietModel dietModel) {
    this.dietPlan = dietModel;
    notifyListeners();
  }
}
