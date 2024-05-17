// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  List<Hospital>? hospital;
  String? patientName;
  String? phone;

  UserModel({
    this.id,
    this.hospital,
    this.patientName,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    hospital: json["Hospital"] == null ? [] : List<Hospital>.from(json["Hospital"]!.map((x) => Hospital.fromJson(x))),
    patientName: json["PatientName"],
    phone: json["Phone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Hospital": hospital == null ? [] : List<dynamic>.from(hospital!.map((x) => x.toJson())),
    "PatientName": patientName,
    "Phone": phone,
  };
}

class Hospital {
  String? hospitalName;

  Hospital({
    this.hospitalName,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    hospitalName: json["HospitalName"],
  );

  Map<String, dynamic> toJson() => {
    "HospitalName": hospitalName,
  };
}
