import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/constants/constants.dart';
import 'package:medlist/pages/auth/RegisterForm2.dart';
import 'package:medlist/pages/auth/verify.dart';
import 'package:medlist/widgets/dropdown.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';
import 'RegisterForm.dart';

class Register extends StatefulWidget {
  String selectedHospital = '';
  bool isLoding = false;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String id = "loginPage";
  String phoneNumber = "";
  String name = "";
  TextEditingController userName = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   FirestoreData.HospitalNamesList(context);
  // }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var provider1 = Provider.of<DataProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/loginback.jpeg"), fit: BoxFit.cover)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.50, sigmaY: 15.50), child: RegisterForm1()),
        ),
      ),
    );
  }

  String? validateAbout(String? value) {
    if (value!.isEmpty) {
      return 'Enter the about';
    }
    return null;
  }

  Widget textField1(String hint, bool pass, bool phone, double height, double width, IconData icon,
      TextEditingController controller, String? Function(String?) validator,
      [int length = 1000, bool num = false]) {
    return Container(
      width: width,

      // margin: EdgeInsets.symmetric(vertical: height * 0.02),
      padding: EdgeInsets.all(width * 0.03),
      child: Expanded(
        child: TextFormField(
          controller: controller,
          keyboardType: phone ? TextInputType.number : null,
          maxLength: length,
          obscureText: pass,
          validator: validator,
          decoration: InputDecoration(
            counterText: "",
            hintText: hint,
            suffixIcon: pass
                ? Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.grey,
                  )
                : null,
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            // labelText: hint,
            prefixIcon: Icon(
              icon,
              color: green2,
            ),
            // labelStyle: GoogleFonts.poppins(fontSize: height * 0.018, color: Colors.green),
            hintStyle: GoogleFonts.poppins(
                fontSize: height * 0.021,
                color: Colors.green.withOpacity(0.7),
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(50),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.red,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.red,
                )),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    List<String> searchItems = provider.hospitalNames;
    List<String> matchQuery = [];
    for (var i in searchItems) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    List<String> searchItems = provider.hospitalNames;
    List<String> matchQuery = [];
    for (var i in searchItems) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return !Register().isLoding
              ? ListTile(
                  onTap: () {
                    print(result);
                    provider.selectedHospital = result;
                    Navigator.pop(context);
                  },
                  title: Text(result),
                )
              : CircularProgressIndicator();
        });
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
