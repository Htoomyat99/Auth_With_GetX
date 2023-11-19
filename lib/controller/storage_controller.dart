import 'package:auth_with_getx/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final box = GetStorage();

  final String _userKey = 'user';
  final String _authKey = 'isAuth';

  RxBool isAuth = false.obs;
  Rx<User?> userData = Rx<User?>(null);

  @override
  void onInit() {
    isAuth.value = getAuth();
    userData.value = getUser();
    super.onInit();
  }

  bool getAuth() {
    bool? isAuth = box.read(_authKey);
    return isAuth ?? false;
  }

  void saveUser(User user) {
    box.write(_userKey, user.toJson()); //save user in register
  }

  User? getUser() {
    final userData = box.read(_userKey); //get data in register
    return userData != null ? User.formJson(userData) : null;
  }

  void login() {
    isAuth.value = true;
    box.write(_authKey, true);
  }

  void register() {
    isAuth.value = true;
    box.write(_authKey, true);
    Get.back(); //initial login to navigate register so we have to use this to directly reach dashboard
  }

  void logOut() {
    isAuth.value = false;
    box.write(_authKey, false);
    // box.write(_authKey, null); for working with api to delete data
  }
}
