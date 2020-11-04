import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gendisdesa/models/user_model.dart';
import 'package:gendisdesa/static_data.dart';
import 'package:get/get.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';

class RegisterController extends GetxController {
  final model = UserModel().obs;
  final isShowPass = false.obs;
  final isLoading = false.obs;
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController desaController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register(AuthBloc bloc) async {
    isLoading.value = !isLoading.value;
    model.update((val) {
      val.nik = nikController.text;
      val.password = passwordController.text;
      val.nama = namaController.text;
      val.tempat = tempatLahirController.text;
      val.desa = desaController.text;
      val.rt = rtController.text;
      val.rw = rwController.text;
      val.kecamatan = kecamatanController.text;
      val.kabupaten = kabupatenController.text;
      val.provinsi = provinsiController.text;
      val.no_telp = noTeleponController.text;
      val.password = passwordController.text;
    });
    bloc..add(AuthBlocRegisterEvent(model.value));
  }

  void showJenisKelaminPicker() {
    int initialIndex = 0;
    if (model.value.jenis != null) {
      int no = 0;
      for (var jenis in StaticData.jenisKelamin) {
        if (jenis == model.value.jenis) {
          initialIndex = no;
        }
        no = no + 1;
      }
    }
    showModalBottomSheet(
        context: Get.context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: initialIndex),
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  model.update((val) {
                    val.jenis = StaticData.jenisKelamin[index];
                  });
                },
                children: new List<Widget>.generate(
                    StaticData.jenisKelamin.length, (int index) {
                  return new Center(
                    child: new Text(StaticData.jenisKelamin[index]),
                  );
                })),
          );
        });
  }
}
