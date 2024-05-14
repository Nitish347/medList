import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/constants/constants.dart';
import 'package:medlist/pages/auth/Register.dart';
import 'package:medlist/pages/auth/RegisterForm.dart';
import 'package:medlist/pages/auth/verify.dart';
import 'package:medlist/widgets/dropdown.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';

class LoginPage extends StatefulWidget {
  String selectedHospital = '';
  bool isLoding = false;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String id = "loginPage";
  String phoneNumber = "";
  String name = "";
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginback.jpeg"), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.50, sigmaY: 5.50),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
              height: height * 0.6,
              width: width * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/medlist.png",
                      height: height * 0.1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),

                    textField1("Enter Your Name", false, false, height, width, Icons.person,
                        userName, validateAbout),
                    textField1("Enter Your phone", false, true, height, width, Icons.phone, phone,
                        validateAbout, 10),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    // dropdown1(["Male", "Female", "Other"], "Select Gender", width, height, userName,
                    //     (p0, p1) {
                    //   setState(() {
                    //     p0.text = p1;
                    //   });
                    // }),
                    // Padding(
                    //   padding: EdgeInsets.all(25.0),
                    //   child: Container(
                    //     height: height * 0.07,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Colors.grey.withOpacity(0.6)),
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: TextFormField(
                    //         onChanged: (value) {
                    //           name = value;
                    //         },
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Please enter your name';
                    //           }
                    //           // You can add more date of birth validation if needed
                    //           return null;
                    //         },
                    //         style: TextStyle(color: Colors.white),
                    //         cursorColor: Colors.white,
                    //         onEditingComplete: () {
                    //           if (phoneNumber.toString().length > 10) print("noooo");
                    //         },
                    //         decoration: InputDecoration(
                    //             contentPadding: EdgeInsets.zero,
                    //             prefixIcon: Icon(
                    //               Icons.person,
                    //               color: Colors.white,
                    //             ),
                    //             border: InputBorder.none,
                    //             hintText: "Enter Your Name",
                    //             hintStyle: GoogleFonts.poppins(
                    //                 color: Colors.white.withOpacity(0.8))),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // InkWell(
                    //   onTap: () async {
                    //     setState(() {});
                    //     showSearch(context: context, delegate: CustomSearchDelegate());
                    //     await FirestoreData.HospitalNamesList(context);
                    //     setState(() {});
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.all(25.0),
                    //     child: Container(
                    //         height: 60,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(50),
                    //             color: Colors.grey.withOpacity(0.6)),
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: [
                    //             SizedBox(
                    //               width: 20,
                    //             ),
                    //             Icon(
                    //               Icons.medical_services_rounded,
                    //               color: Colors.white,
                    //             ),
                    //             SizedBox(
                    //               width: 12,
                    //             ),
                    //             Text(
                    //               provider.selectedHospital,
                    //               style: TextStyle(fontSize: 17, color: Colors.white),
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(25.0),
                    //   child: Container(
                    //     height: 60,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Colors.grey.withOpacity(0.6)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: TextField(
                    //         onChanged: (value) {
                    //           phoneNumber = value;
                    //         },
                    //         style: TextStyle(color: Colors.white),
                    //         cursorColor: Colors.white,
                    //         onEditingComplete: () {
                    //           if (phoneNumber.toString().length > 10) print("noooo");
                    //         },
                    //         decoration: InputDecoration(
                    //             // prefix: Text("  +91"),
                    //             prefixText: ("  +91 "),
                    //             border: InputBorder.none,
                    //             hintText: "Phone Number",
                    //             hintStyle: TextStyle(color: Colors.white)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // // SizedBox(height: height/25,),
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {}
                          provider.UserName = name;
                          provider.UserPhoneNumber = phoneNumber;
                          if (name != "" && phoneNumber != "") Get.to(Register());
                        },
                        child: Container(
                          height: height * 0.065,
                          width: width,
                          decoration: BoxDecoration(
                            color: green1,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => RegisterForm1());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          Text(
                            " Register",
                            style: GoogleFonts.poppins(color: green1),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateAbout(String? value) {
    if (value!.isEmpty) {
      return '*required!';
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
          return !LoginPage().isLoding
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
