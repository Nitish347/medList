class User {
  String? name;
  String? hospitalName;
  String? phoneNumber;
  String? uid;
  String? picUrl;

  User({this.picUrl, this.name, this.phoneNumber, this.uid, this.hospitalName});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["name"],
      picUrl: json["picUrl"],
      uid: json["uid"],
      hospitalName: json["hospitalName"],
      phoneNumber: json["phoneNumber"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "picUrl": picUrl,
        "hospitalName": hospitalName,
        "phoneNumber": phoneNumber,
      };
}
