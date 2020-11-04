import 'package:flutter/material.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:get/get.dart';

class CariDifabelController extends GetxController {
  final nik = ''.obs;
  final isLoading = false.obs;
  TextEditingController nikController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void cari(DifabelBloc bloc) {
    isLoading.value = !isLoading.value;
    nik.value = nikController.text;
    bloc.add(CariDataDifabelBlocEvent(nik.value));
  }
}
