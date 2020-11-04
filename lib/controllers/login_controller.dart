import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';

class LoginController extends GetxController {
  final nik = ''.obs;
  final password = ''.obs;
  final isShowPass = false.obs;
  final isLoading = false.obs;
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login(AuthBloc bloc) async {
    isLoading.value = !isLoading.value;
    nik.value = nikController.text;
    password.value = passwordController.text;
    bloc..add(AuthBlocLoginEvent(nik.value, password.value));
  }
}
