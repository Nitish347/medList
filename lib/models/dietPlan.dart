class DietModel {
  List<dynamic>? eat = [];

  DietModel({
    this.eat,
  });
  factory DietModel.fromMap(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
      );
  factory DietModel.fromMap1(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
      );
  Map<String, dynamic> toMap() => {
        "eat": eat,
      };
}
