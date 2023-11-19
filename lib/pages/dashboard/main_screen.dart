import 'package:auth_with_getx/controller/storage_controller.dart';
import 'package:auth_with_getx/controller/home_controller.dart';
import 'package:auth_with_getx/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeController = Get.put(HomeController());
  final storeController = Get.put(StorageController());

  @override
  Widget build(BuildContext context) {
    final userData = storeController.getUser();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardWidget(
                          label: 'User Name', value: userData?.userName ?? ''),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      CardWidget(
                          label: 'Phone Number', value: userData?.phone ?? ''),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      CardWidget(
                          label: 'Address', value: userData?.address ?? ''),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                      CardWidget(
                          label: 'Date of Birth',
                          value: userData?.dateOfBirth ?? ''),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  homeController.confrimLogOut(context);
                },
                child: const Text('Log Out'))
          ]),
        ),
      ),
    );
  }
}
