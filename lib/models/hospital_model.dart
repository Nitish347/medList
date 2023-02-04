class HospitalModel {
  String? HospitalName;
  String? DrName;
  String? HospitalAddress;
  String? HospitalContact;
  HospitalModel(
      {this.HospitalName,
      this.DrName,
      this.HospitalAddress,
      this.HospitalContact});

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
      DrName: json["DrName"],
      HospitalAddress: json["HospitalAddress"],
      HospitalName: json["HospitalName"],
      HospitalContact: json["HospitalContact"]);

  Map<String, dynamic> toJson() => {
        "DrName": DrName,
        "HospitalAddress": HospitalAddress,
        "HospitalName": HospitalName,
        "HospitalContact": HospitalContact,
      };
}
