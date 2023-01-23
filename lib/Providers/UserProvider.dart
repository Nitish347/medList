import 'package:flutter/cupertino.dart';
import 'package:medlist/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? user;
  void updateUser(User user) {
    this.user = user;
    notifyListeners();
  }
}
