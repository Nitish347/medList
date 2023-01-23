class ExerciseModel {
  String? name;
  DateTime? time;
  String? picUrl;
  ExerciseModel({this.name, this.picUrl, this.time});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
      name: json["name"], picUrl: json["picUrl"], time: json["time"].toDate());

  Map<String, dynamic> toJson() => {
        "name": name,
        "picUrl": picUrl,
        "time": time?.toIso8601String(),
      };
}
