import 'package:auth_with_getx/components/btn_text.dart';
import 'package:auth_with_getx/components/date_time.dart';
import 'package:auth_with_getx/components/pass_text_input.dart';
import 'package:auth_with_getx/components/text_input_box.dart';
import 'package:auth_with_getx/pages/auth/login_screen.dart';
import 'package:auth_with_getx/pages/dashboard/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _phoneController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _addressController = TextEditingController();
  bool passObsecureText = false;
  bool confirmPassObsecureText = false;

  void passVisibleToggle() {
    setState(() {
      passObsecureText = !passObsecureText;
    });
  }

  void confirmPassVisibleToggle() {
    setState(() {
      confirmPassObsecureText = !confirmPassObsecureText;
    });
  }

  void goDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
  }

  void registerAction() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  void goLogIn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.shopify,
                color: Colors.orange.shade800,
                size: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'HELLO NEWERS!',
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Welcome to Shoptify App',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextInputBox(
                controller: _phoneController,
                inputText: 'Phone',
                keyboardType: true,
                hintText: '09',
                icon: Icon(Icons.phone),
              ),
              TextInputBox(
                controller: _userNameController,
                inputText: 'User Name',
                keyboardType: false,
                hintText: '',
                icon: Icon(Icons.people),
              ),
              TextInputBox(
                inputText: 'Address',
                hintText: '',
                controller: _addressController,
                keyboardType: false,
                icon: Icon(Icons.location_city),
              ),
              // TextInputBox(
              //   inputText: 'Date of Birth',
              //   hintText: '',
              //   controller: _dateController,
              //   keyboardType: false,
              //   icon: Icon(Icons.calendar_month),
              // ),
              SizedBox(
                height: 8,
              ),
              DateTimeWidget(
                datePicker: goDatePicker,
              ),
              SizedBox(
                height: 8,
              ),
              PasswordInputBox(
                inputText: 'Password',
                hintText: '',
                controller: _passController,
                keyboardType: false,
                icon: Icon(Icons.password),
                obsecureText: passObsecureText,
                toggleVisibility: passVisibleToggle,
              ),
              PasswordInputBox(
                inputText: 'Confirm Password',
                hintText: '',
                controller: _confirmPassController,
                keyboardType: false,
                icon: Icon(Icons.password),
                obsecureText: confirmPassObsecureText,
                toggleVisibility: confirmPassVisibleToggle,
              ),
              SizedBox(
                height: 30,
              ),
              ButtonText(onPressed: registerAction, btnText: 'Register'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member',
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 13),
                  ),
                  TextButton(
                    onPressed: goLogIn,
                    child: Text(
                      'Log In',
                      style: GoogleFonts.lato(color: Colors.teal, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}