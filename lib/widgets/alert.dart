import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlist/constants/constants.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future alert(BuildContext context, String title, String text, bool error) {
  return QuickAlert.show(
      context: context,
      type: error ? QuickAlertType.error : QuickAlertType.success,
      title: title,
      text: text,
      confirmBtnColor: Colors.red);
}
