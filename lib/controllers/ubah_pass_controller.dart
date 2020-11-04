import 'package:flutter/material.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:get/get.dart';

class UbahPassController extends GetxController {
  final oldpassword = ''.obs;
  final newpassword = ''.obs;
  final isShowPass = false.obs;
  final isLoading = false.obs;
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changePass(AuthBloc bloc) async {
    isLoading.value = !isLoading.value;
    oldpassword.value = oldpasswordController.text;
    newpassword.value = newpasswordController.text;
    bloc..add(AuthBlocChangePassEvent(oldpassword.value, newpassword.value));
  }
}
