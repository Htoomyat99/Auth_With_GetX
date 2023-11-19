import 'package:auth_with_getx/widgets/alert_modal.dart';
import 'package:auth_with_getx/controller/storage_controller.dart';
import 'package:auth_with_getx/res/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final storeController = Get.put(StorageController());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passObsecureText = true.obs;

  void passVisibleToggle() {
    passObsecureText.value = !passObsecureText.value;
  }

  void goRegister() {
    Get.toNamed(Nav.register);
    phoneController.text = '';
    passwordController.text = '';
  }

  void loginAction(BuildContext context) {
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final savedUser = storeController.getUser();
      if (savedUser?.phone != null && savedUser?.password != null) {
        if (phoneController.text == savedUser?.phone &&
            passwordController.text == savedUser?.password) {
          storeController.login();
          phoneController.text = '';
          passwordController.text = '';
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertModal(
                  titleText: 'OOPS!',
                  contentText: 'Phone number or Password Incorrect',
                  onClosed: Get.back,
                  btnText: 'Try Again');
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertModal(
                titleText: 'OOPS!',
                contentText: 'No account found! Please register first.',
                onClosed: Get.back,
                btnText: 'OK');
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertModal(
              titleText: 'OOPS!',
              contentText: 'Please fill the required fields',
              onClosed: Get.back,
              btnText: 'OK');
        },
      );
    }
  }
}
