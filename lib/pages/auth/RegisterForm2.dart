import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../widgets/dropdown.dart';

// import '../../Constants.dart';

class RegisterForm2 extends StatefulWidget {
  @override
  _RegisterForm2State createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _NGOName = TextEditingController();
  TextEditingController _NGOAddress = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title("Address", height),
              TextFormField(
                controller: _NGOName,
                decoration: decoration(
                    "Eg. C 83/22 Govindpuram, Ghaziabad", height, Icons.location_on_sharp),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  // You can add more complex email validation if needed
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              title("State", height),
              dropdown1(["Male", "Female", "Other"], "Select State", width, height,
                  _phoneNumberController, (p0, p1) => null, Icons.account_balance_rounded),
              SizedBox(height: height * 0.02),
              title("City", height),
              dropdown1(["Male", "Female", "Other"], "Select City", width, height,
                  _phoneNumberController, (p0, p1) => null, Icons.location_city),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.06,
              ),
              Container(
                width: width,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, perform your registration logic here
                      // For example, you can print the values for demonstration
                      print('Email: ${_emailController.text}');
                      print('Phone Number: ${_phoneNumberController.text}');
                      print('Date of Birth: ${_dobController.text}');
                      print('Password: ${_passwordController.text}');
                      print('Repeat Password: ${_repeatPasswordController.text}');
                    }
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width,
                    decoration: BoxDecoration(
                      color: green1,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String text, double height) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 20),
      child: Text(
        text,
        style: GoogleFonts.dmSans(
            fontSize: height * 0.021, color: green2, fontWeight: FontWeight.w600),
      ),
    );
  }

  InputDecoration decoration(String hint, double height, IconData icon) {
    return InputDecoration(
      isDense: true,
      counterText: "",
      hintText: hint,
      filled: true,
      fillColor: Colors.white.withOpacity(0.8),
      hintStyle: GoogleFonts.poppins(
          fontSize: height * 0.021,
          color: Colors.green.withOpacity(0.7),
          fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.all(height * 0.013),
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
      prefixIcon: Icon(
        icon,
        color: Colors.green,
        size: height * 0.025,
      ),
    );
  }
}
