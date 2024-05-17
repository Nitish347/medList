// To parse this JSON data, do
//
//     final medicineModel = medicineModelFromJson(jsonString);

import 'dart:convert';

MedicineModel medicineModelFromJson(String str) => MedicineModel.fromJson(json.decode(str));

String medicineModelToJson(MedicineModel data) => json.encode(data.toJson());

class MedicineModel {
  String? medicineName;
  DateTime? timeTaken;
  String? mealTime;
  String? picture;
  DateTime? dateAdded;
  String? id;

  MedicineModel({
    this.medicineName,
    this.timeTaken,
    this.mealTime,
    this.picture,
    this.dateAdded,
    this.id,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    medicineName: json["MedicineName"],
    timeTaken: json["TimeTaken"] == null ? null : DateTime.parse(json["TimeTaken"]),
    mealTime: json["MealTime"],
    picture: json["Picture"],
    dateAdded: json["DateAdded"] == null ? null : DateTime.parse(json["DateAdded"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "MedicineName": medicineName,
    "TimeTaken": timeTaken?.toIso8601String(),
    "MealTime": mealTime,
    "Picture": picture,
    "DateAdded": dateAdded?.toIso8601String(),
    "_id": id,
  };
}
