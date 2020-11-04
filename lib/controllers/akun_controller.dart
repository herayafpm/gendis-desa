import 'package:gendisdesa/models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AkunController extends GetxController {
  final akun = UserModel().obs;

  @override
  void onInit() async {
    var usermodelBox = await Hive.openBox("user_model");
    UserModel user = usermodelBox.getAt(0);
    akun.value = user;
    super.onInit();
  }

  void logout() async {
    var boxUser = await Hive.openBox("user_model");
    boxUser.deleteAt(0);
    Get.offAllNamed("/home");
  }
}
