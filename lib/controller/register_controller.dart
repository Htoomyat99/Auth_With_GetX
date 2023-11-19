import 'package:auth_with_getx/widgets/alert_modal.dart';
import 'package:auth_with_getx/controller/storage_controller.dart';
import 'package:auth_with_getx/models/user.dart';
import 'package:auth_with_getx/res/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final storeController = Get.put(StorageController());

  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  RxBool passObsecureText = true.obs;
  RxBool confirmPassObsecureText = true.obs;
  RxString dateOfBirth = ''.obs;

  void passVisibleToggle() {
    passObsecureText.value = !passObsecureText.value;
  }

  void confirmPassVisibleToggle() {
    confirmPassObsecureText.value = !confirmPassObsecureText.value;
  }

  void goLogIn() {
    Get.toNamed(Nav.login);
    phoneController.text = '';
    userNameController.text = '';
    passController.text = '';
    addressController.text = '';
    dateOfBirth = ''.obs;
    passController.text = '';
    confirmPassController.text = '';
  }

  void registerAction(BuildContext context, String dateOfBirth) {
    final regUser = User(
        phone: phoneController.text,
        userName: userNameController.text,
        address: addressController.text,
        dateOfBirth: dateOfBirth,
        password: passController.text);

    if (regUser.phone.isNotEmpty &&
        regUser.userName.isNotEmpty &&
        regUser.dateOfBirth.isNotEmpty &&
        regUser.password.isNotEmpty &&
        confirmPassController.text.isNotEmpty) {
      if (regUser.password == confirmPassController.text) {
        storeController.saveUser(regUser);
        storeController.register();
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertModal(
                titleText: 'OOPS!',
                contentText: 'Password and Confirm Password must be the same.',
                onClosed: () {
                  Get.back();
                },
                btnText: 'OK');
          },
        );
      }
    } else {
      debugPrint('Error message');
      showDialog(
        context: context,
        builder: (context) {
          return AlertModal(
            titleText: 'OOPS!',
            contentText: 'Please fill the require fields.',
            btnText: 'OK',
            onClosed: () {
              Get.back();
            },
          );
        },
      );
    }
  }
}
