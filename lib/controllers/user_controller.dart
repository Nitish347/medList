import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medlist/models/new_user_model.dart';

import 'NetworkHandler.dart';
class UserController extends GetxController{

  Rx<UserModel> userModel = UserModel().obs;
  // ****************************************GET USER*******************************************************
  getUser()async{
    log("getting user....");
    try{
      var response = await NetworkHandler.get("patientDetail");
      if(response != null){

        var data  = json.decode(response);
        log(data.toString());
        userModel.value = UserModel.fromJson(data);
        log(userModel.value.hospital?[0].hospitalName ?? "");
      }
    }catch(e){
      log(e.toString());
    }
  }
}