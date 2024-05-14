import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../pages/home.dart';
import 'NetworkHandler.dart';


class SigningController extends GetxController {

  static final client = http.Client();
  static const storage = FlutterSecureStorage();
   void signing(var data) async {
    log(data.toString());
    data = jsonEncode(data);
    try {
      var response = await NetworkHandler.post(data, "Create_Hospital");
      log(response);
      return jsonDecode(response);
    } catch (e) {
      log(e.toString());
    }
  }

   otpVerify(String otp, String id) async {
    log(otp.toString());
    var data = jsonEncode({"otp": otp});
    try {
      var response = await NetworkHandler.post(data, "VerifyEmail?id=$id");
      log(response);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

   login(String email, String otp)async{
     log(email);
     log(otp);
    try{
      var data = json.encode({
          "Email" : email,
          "Password" : otp
      });
      var response = await NetworkHandler.post(data, "login_Hospital");
      print(response);
      var data2 = json.decode(response);
     storeToken(data2["token"]);
      if(data2['token'] != null){
        // UserData().getUser();
        Get.offAll(()=>  HomeScreen(uid: '',));
      }
    }catch(e){
      log(e.toString());
    }
  }
  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }
  static Future<String?> getToken() async {
     print(await storage.read(key: 'token'));
    return await storage.read(key: "token");
  }

  static Future<String?> removeToken() async {
    await storage.deleteAll();

    if (await storage.read(key: "token") == null) {
      // Get.offAllNamed(Routes.LOGIN);
    } else {
      log("Failed to empty storage");
    }
    return null;
  }
}
