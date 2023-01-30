class HospitalModel {
  String? HospitalName;
  String? DrName;
  String? HospitalAdrress;
  String? HospitalContact;
  HospitalModel(
      {this.HospitalName,
      this.DrName,
      this.HospitalAdrress,
      this.HospitalContact});

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
      DrName: json["DrName"],
      HospitalAdrress: json["HospitalAdrress"],
      HospitalName: json["HospitalName"],
      HospitalContact: json["HospitalContact"]);

  Map<String, dynamic> toJson() => {
        "DrName": DrName,
        "HospitalAdrress": HospitalAdrress,
        "HospitalName": HospitalName,
        "HospitalContact": HospitalContact,
      };
}
