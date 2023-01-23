class PastMedicineModel {
  DateTime? time;
  List<String>? name;
  PastMedicineModel({this.name, this.time});

  factory PastMedicineModel.fromJson(Map<String, dynamic> json) =>
      PastMedicineModel(name: json["name"], time: json["time"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time?.toIso8601String(),
      };
}
