class User {
  String? name;
  String? hospitalName;
  String? phoneNumber;
  String? uid;
  String? picUrl;

  User({this.picUrl, this.name, this.phoneNumber, this.uid, this.hospitalName});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["Name"],
      picUrl: json["picUrl"],
      uid: json["uid"],
      hospitalName: json["HospitalName"],
      phoneNumber: json["PhoneNumber"]);

  Map<String, dynamic> toJson() => {
        "Name": name,
        "uid": uid,
        "picUrl": picUrl,
        "HospitalName": hospitalName,
        "PhoneNumber": phoneNumber,
      };
}
