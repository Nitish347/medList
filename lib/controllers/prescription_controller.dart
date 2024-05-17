import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:medlist/models/new_medicine_model.dart';

import 'NetworkHandler.dart';

class PrescriptionController extends GetxController{
RxList<MedicineModel> medicineList = <MedicineModel>[].obs;

  getMedicines()async{
    medicineList.clear();
    try{
      var response = await NetworkHandler.get("Medicine");
      if(response != null){
        var data  = json.decode(response);
        for(var i in data){
          try{
            MedicineModel medicineModel = MedicineModel.fromJson(i);
            medicineList.add(medicineModel);
          }catch(e){

          }
        }
      }
    }catch(e){
      log(e.toString());
    }
  }
}