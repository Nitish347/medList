class DietModel {
  List<dynamic>? eat = [];
  List<dynamic>? avoid = [];

  DietModel({
    this.eat,
    this.avoid
  });
  factory DietModel.fromMap(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
    avoid: json["avoid"],
      );
  factory DietModel.fromMap1(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
    avoid: json["avoid"],
      );
  Map<String, dynamic> toMap() => {
        "eat": eat,
        "avoid": avoid,
      };
}
