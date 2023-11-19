import 'package:auth_with_getx/controller/storage_controller.dart';
import 'package:auth_with_getx/widgets/confirm_alert_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final storeController = Get.put(StorageController());

  void confrimLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmAlertModal(
          titleText: 'OOPS!',
          contentText: 'Are you sure you want to log out?',
          onClosed: Get.back,
          confirmText: 'Confirm',
          cancelText: 'Cancel',
          confirmAction: logOutAction,
        );
      },
    );
  }

  void logOutAction() {
    storeController.logOut();
    Get.back();
  }
}
