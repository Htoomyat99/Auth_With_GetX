import 'package:auth_with_getx/components/btn_text.dart';
import 'package:auth_with_getx/components/pass_text_input.dart';
import 'package:auth_with_getx/components/text_input_box.dart';
import 'package:auth_with_getx/pages/auth/register_screen.dart';
import 'package:auth_with_getx/pages/dashboard/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  bool passObsecureText = false;

  void passVisibleToggle() {
    setState(() {
      passObsecureText = !passObsecureText;
    });
  }

  void goRegister() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => RegisterScreen(),
    //   ),
    // );
    Get.to(
      const RegisterScreen(),
    );
  }

  void logInAction() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => MainScreen(),
    //   ),
    // );
    debugPrint(
        'phone >>> ${_phoneController.text} password >>> ${_passController.text}');
    // Get.off(
    //   () => const MainScreen(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Icon(
                Icons.shopify,
                color: Colors.orange.shade800,
                size: 150,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'HELLO AGAIN!',
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Welcome back, you\'ve been missed!',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextInputBox(
                controller: _phoneController,
                inputText: 'Phone',
                keyboardType: true,
                hintText: '09',
                icon: Icon(Icons.phone),
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
              SizedBox(
                height: 35,
              ),
              ButtonText(onPressed: logInAction, btnText: 'Log In'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 13),
                  ),
                  TextButton(
                    onPressed: goRegister,
                    child: Text(
                      'Register now',
                      style: GoogleFonts.lato(color: Colors.teal, fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
