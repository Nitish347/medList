class DietModel {
  List<dynamic>? eat = [];
  List<dynamic>? notEat = [];
  DietModel({this.eat, this.notEat});
  factory DietModel.fromMap(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
        notEat: json["notEat"],
      );
  factory DietModel.fromMap1(Map<String, dynamic> json) => DietModel(
        eat: json["eat"],
        notEat: json["notEat"],
      );
  Map<String, dynamic> toMap() => {
        "eat": eat,
        "notEat": notEat,
      };
}
