import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';

class ForgotPassController extends GetxController {
  final nik = ''.obs;
  final password = ''.obs;
  final password2 = ''.obs;
  final isShowPass = false.obs;
  final isLoading = false.obs;
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void forgotpass(AuthBloc bloc) async {
    isLoading.value = !isLoading.value;
    nik.value = nikController.text;
    password.value = passwordController.text;
    bloc..add(AuthBlocForgotPassEvent(nik.value, password.value));
  }
}
