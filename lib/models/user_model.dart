class User {
  String? name;
  String? hospitalName;
  String? phoneNumber;
  String? picUrl;

  User({this.picUrl, this.name, this.phoneNumber, this.hospitalName});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["name"],
      picUrl: json["picUrl"],
      hospitalName: json["hospitalName"],
      phoneNumber: json["phoneNumber"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "picUrl": picUrl,
        "hospitalName": hospitalName,
        "phoneNumber": phoneNumber,
      };
}
