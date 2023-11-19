import 'package:auth_with_getx/widgets/btn_text.dart';
import 'package:auth_with_getx/widgets/date_time.dart';
import 'package:auth_with_getx/widgets/pass_text_input.dart';
import 'package:auth_with_getx/widgets/text_input_box.dart';
import 'package:auth_with_getx/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(RegisterController());
  String dateOfBirth = '';

  void goDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day);
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.teal),
          ),
          child: child!,
        );
      },
    );

    debugPrint('ptint ${date.runtimeType}');

    setState(() {
      final formatter = DateFormat.yMd();
      final formattedDate = formatter.format(date as DateTime);
      dateOfBirth = formattedDate;
    });
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
              const SizedBox(
                height: 30,
              ),
              Icon(
                Icons.shopify,
                color: Colors.orange.shade800,
                size: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'HELLO NEWERS!',
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Welcome to Shoptify App',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextInputBox(
                controller: controller.phoneController,
                inputText: 'Phone',
                keyboardType: true,
                hintText: '09',
                icon: const Icon(Icons.phone),
              ),
              TextInputBox(
                controller: controller.userNameController,
                inputText: 'User Name',
                keyboardType: false,
                hintText: '',
                icon: const Icon(Icons.people),
              ),
              TextInputBox(
                inputText: 'Address',
                hintText: '',
                controller: controller.addressController,
                keyboardType: false,
                icon: const Icon(Icons.location_city),
              ),
              const SizedBox(
                height: 8,
              ),
              DateTimeWidget(
                dateOfBirth: dateOfBirth,
                datePicker: goDatePicker,
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => PasswordInputBox(
                  inputText: 'Password',
                  hintText: '',
                  controller: controller.passController,
                  keyboardType: false,
                  icon: const Icon(Icons.password),
                  obsecureText: controller.passObsecureText.value,
                  toggleVisibility: controller.passVisibleToggle,
                ),
              ),
              Obx(
                () => PasswordInputBox(
                  inputText: 'Confirm Password',
                  hintText: '',
                  controller: controller.confirmPassController,
                  keyboardType: false,
                  icon: const Icon(Icons.password),
                  obsecureText: controller.confirmPassObsecureText.value,
                  toggleVisibility: controller.confirmPassVisibleToggle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonText(
                  onPressed: () {
                    controller.registerAction(context, dateOfBirth);
                  },
                  btnText: 'Register'),
              const SizedBox(
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
                    onPressed: controller.goLogIn,
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
