class MedicineModel {
  String? name;
  DateTime? time;
  String? picUrl;
  MedicineModel({this.name, this.picUrl, this.time});

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
      name: json["name"], picUrl: json["picUrl"], time: json["time"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "picUrl": picUrl,
        "time": time?.toIso8601String(),
      };
}
