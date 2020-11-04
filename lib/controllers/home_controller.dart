import 'package:gendisdesa/models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePageController extends GetxController {
  final status = false.obs;
  final isLoggedIn = false.obs;
  @override
  void onInit() {
    // cekLogin();
    super.onInit();
  }

  void cekLogin(String to) async {
    try {
      var usermodelHive = await Hive.openBox("user_model");
      UserModel user = usermodelHive.getAt(0);
      if (user != null) {
        Get.toNamed("/splash_dashboard");
      }
    } catch (e) {
      Get.toNamed(to);
    }
  }
}
