import 'package:auth_with_getx/widgets/btn_text.dart';
import 'package:auth_with_getx/widgets/pass_text_input.dart';
import 'package:auth_with_getx/widgets/text_input_box.dart';
import 'package:auth_with_getx/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Icon(
                Icons.shopify,
                color: Colors.orange.shade800,
                size: 150,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'HELLO AGAIN!',
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Welcome back, you\'ve been missed!',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TextInputBox(
                controller: controller.phoneController,
                inputText: 'Phone',
                keyboardType: true,
                hintText: '09',
                icon: const Icon(Icons.phone),
              ),
              Obx(
                () => PasswordInputBox(
                  inputText: 'Password',
                  hintText: '',
                  controller: controller.passwordController,
                  keyboardType: false,
                  icon: const Icon(Icons.password),
                  obsecureText: controller.passObsecureText.value,
                  toggleVisibility: controller.passVisibleToggle,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ButtonText(
                  onPressed: () {
                    controller.loginAction(context);
                  },
                  btnText: 'Log In'),
              const SizedBox(
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
                    onPressed: controller.goRegister,
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
