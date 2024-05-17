import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'SigninController.dart';

class NetworkHandler {

  static final client = http.Client();
  static Future<String> post(var body, String endpoint) async {
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjA1YTEyZTc2ZmNkMGM0ZTgwYTY2NDgiLCJpYXQiOjE3MTU5NzM5NjJ9.K1XrU5nIfz3Tgmsz03xlfCXqzpEjSnimqq0KvaqIvuc";

    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    log(response.body);
    return response.body;
  }
  static Future<String> auth_post(var body, String endpoint) async {
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjA1YTEyZTc2ZmNkMGM0ZTgwYTY2NDgiLCJpYXQiOjE3MTU5NzM5NjJ9.K1XrU5nIfz3Tgmsz03xlfCXqzpEjSnimqq0KvaqIvuc";

    // var token = await SigningController.getToken();
    if (token != null) {
      var response = await client.post(buildUrl(endpoint), body: body, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      return response.body;
    } else {
      log(token.toString());
      log("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }
  static Future<String> auth_patch(var body, String endpoint) async {
    // var token = await SigningController.getToken();
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjA1YTEyZTc2ZmNkMGM0ZTgwYTY2NDgiLCJpYXQiOjE3MTU5NzM5NjJ9.K1XrU5nIfz3Tgmsz03xlfCXqzpEjSnimqq0KvaqIvuc";

    if (token != null) {
      var response = await client.patch(buildUrl(endpoint), body: body, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      return response.body;
    } else {
      log(token.toString());
      log("token failed to get");
    }

    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }
  static Future<String> get(String endpoint) async {
    // var token = await SigningController.getToken();
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjA1YTEyZTc2ZmNkMGM0ZTgwYTY2NDgiLCJpYXQiOjE3MTU5NzM5NjJ9.K1XrU5nIfz3Tgmsz03xlfCXqzpEjSnimqq0KvaqIvuc";

    log( "token->$token");

    if (token != null) {
      var response = await client.get(buildUrl(endpoint), headers: {
        // 'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });
      log(response.body);
      return response.body;
    } else {
      log("token failed to get");
    }
    return jsonEncode({"status": "failed", "msg": "nothing get"});
  }
  static Uri buildUrl(String endpoint) {
    String host = "https://medlist-shivikatyagi.onrender.com/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

}
