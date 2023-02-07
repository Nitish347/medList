import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medlist/FirestoreMethods/FirestoreMethods.dart';
import 'package:medlist/Providers/DataProvider.dart';
import 'package:medlist/pages/auth/verify.dart';
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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   FirestoreData.HospitalNamesList(context);
  // }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    var provider1 = Provider.of<DataProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginback.jpeg"),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.50, sigmaY: 1.50),
          child: Container(
            // color: Colors.black.withOpacity(0.2),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  height: 650,
                  width: 350,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/images/medlist.png",
                          height: 80,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.6)),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  name = value;
                                },
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                onEditingComplete: () {
                                  if (phoneNumber.toString().length > 10)
                                    print("noooo");
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.white,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Enter Your Name",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {});
                            showSearch(
                                context: context,
                                delegate: CustomSearchDelegate());
                            await FirestoreData.HospitalNamesList(context);
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.withOpacity(0.6)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.medical_services_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      provider.selectedHospital,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.6)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  phoneNumber = value;
                                },
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                onEditingComplete: () {
                                  if (phoneNumber.toString().length > 10)
                                    print("noooo");
                                },
                                decoration: InputDecoration(
                                    // prefix: Text("  +91"),
                                    prefixText: ("  +91 "),
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: height/25,),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: InkWell(
                            onTap: () {
                              provider.UserName = name;
                              provider.UserPhoneNumber = phoneNumber;
                              if (name != "" && phoneNumber != "")
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyPage(
                                              phoneNumber: phoneNumber,
                                            )));
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
