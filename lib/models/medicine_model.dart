import 'package:intl/intl.dart';

class Medicine {
  int? id;
  String? title;
  DateTime? alarmDateTime;
  bool? isPending;
  int? gradientColorIndex;

  Medicine(
      {this.id,
      this.title,
      this.alarmDateTime,
      this.isPending,
      this.gradientColorIndex});

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
        gradientColorIndex: json["gradientColorIndex"],
      );
  factory Medicine.fromMap1(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
        gradientColorIndex: json["gradientColorIndex"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
        "isPending": isPending,
        "gradientColorIndex": gradientColorIndex,
      };
}
