import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineData {
  static fetchData() async {
    print("fetching");
    var snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc("HospitalName")
        .collection("Patients")
        .doc("uid1")
        .collection("Medicines")
        .get();
    for (var queryDocumentSnapshot in snap.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      print(data);
      // var name = data['name'];
      // var phone = data['phone'];
      // print(name);
    }
  }
}
