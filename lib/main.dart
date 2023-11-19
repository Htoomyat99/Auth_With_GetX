import 'package:auth_with_getx/controller/storage_controller.dart';
import 'package:auth_with_getx/pages/auth/login_screen.dart';
import 'package:auth_with_getx/pages/auth/register_screen.dart';
import 'package:auth_with_getx/pages/dashboard/main_screen.dart';
import 'package:auth_with_getx/pages/welcome_screen.dart';
import 'package:auth_with_getx/res/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.put(StorageController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Nav.login,
      getPages: [
        GetPage(
          name: Nav.welcome,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: Nav.login,
          page: () => Obx(() =>
              controller.isAuth.value == true ? MainScreen() : LoginScreen()),
        ),
        GetPage(
          name: Nav.register,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: Nav.dashboard,
          page: () => MainScreen(),
        ),
      ],
    );
  }
}
