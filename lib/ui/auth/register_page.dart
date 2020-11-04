import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:gendisdesa/controllers/register_controller.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_date_picker_comp.dart';
import 'package:gendisdesa/ui/components/item_picker_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterPage extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Txt("Pendaftaran Akun"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BodyRegisterPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyRegisterPage extends StatelessWidget {
  final controller = Get.find<RegisterController>();
  // ignore: close_sinks
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    return SingleChildScrollView(
      child: Parent(
        style: ParentStyle()
          ..padding(horizontal: 20)
          ..margin(top: 20, bottom: 20),
        child: Form(
          key: controller.formKey,
          child: BlocListener<AuthBloc, AuthBlocState>(
            listener: (context, state) async {
              controller.isLoading.value = false;
              if (state is AuthBlocStateLoading) {
                controller.isLoading.value = true;
              } else if (state is AuthBlocStateError) {
                controller.isLoading.value = false;
                Flushbar(
                  title: "Error",
                  message: state.error,
                  duration: Duration(seconds: 5),
                  icon: Icon(
                    Icons.do_not_disturb,
                    color: Colors.redAccent,
                  ),
                  flushbarPosition: FlushbarPosition.TOP,
                )..show(Get.context);
              } else if (state is AuthBlocStateSuccess) {
                controller.nikController.clear();
                controller.passwordController.clear();
                controller.namaController.clear();
                controller.tempatLahirController.clear();
                controller.desaController.clear();
                controller.rtController.clear();
                controller.rwController.clear();
                controller.kecamatanController.clear();
                controller.kabupatenController.clear();
                controller.provinsiController.clear();
                controller.noTeleponController.clear();
                controller.model.value.tanggal = null;
                controller.model.value.jenis = null;
                Flushbar(
                  title: "Success",
                  message: state.data['message'] ?? "",
                  duration: Duration(seconds: 3),
                  onStatusChanged: (status) {
                    if (status == FlushbarStatus.DISMISSED) {
                      Get.offNamed("/login");
                    }
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  ),
                  flushbarPosition: FlushbarPosition.TOP,
                )..show(Get.context);
              }
            },
            child: Column(
              children: [
                ItemTextFieldComp(
                    controller: controller.nikController,
                    title: "NIK",
                    tipe: TextInputType.number,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "NIK tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.namaController,
                    title: "Nama Lengkap",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.tempatLahirController,
                    title: "Tempat Lahir",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Tempat Lahir tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                Obx(() => ItemDatePickerComp(
                      currentDate: controller.model.value.tanggal,
                      text: (controller.model.value.tanggal != null)
                          ? DateTimeUtils.convert(
                              controller.model.value.tanggal)
                          : "Pilih Tanggal Lahir",
                      onConfirm: (date) {
                        FocusScope.of(context).unfocus();
                        controller.model.update((val) {
                          val.tanggal = date;
                        });
                      },
                    )),
                SizedBox(
                  height: 0.01.sh,
                ),
                Obx(() => ItemPickerComp(
                      title: "Jenis Kelamin",
                      text: (controller.model.value.jenis != null)
                          ? controller.model.value.jenis
                          : "Pilih Jenis Kelamin",
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.showJenisKelaminPicker();
                      },
                    )),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.desaController,
                    title: "Desa",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Desa tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.rtController,
                    title: "RT",
                    tipe: TextInputType.number,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "RT tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.rwController,
                    title: "RW",
                    tipe: TextInputType.number,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "RW tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.kecamatanController,
                    title: "Kecamatan",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Kecamatan tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.kabupatenController,
                    title: "Kabupaten",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Kabupaten tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.provinsiController,
                    title: "Provinsi",
                    tipe: TextInputType.text,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Provinsi tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.noTeleponController,
                    title: "No Telepon (WA)",
                    tipe: TextInputType.phone,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "No Telepon tidak boleh kosong";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                ItemTextFieldComp(
                    controller: controller.passwordController,
                    title: "Password",
                    tipe: TextInputType.text,
                    obsecure: true,
                    onSaved: null,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      if (value.length < 6) {
                        return "Password harus lebih dari 6 karakter";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 0.05.sh,
                ),
                Obx(() => ItemButtonComp(
                    title: "Kirim Data",
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (controller.formKey.currentState.validate()) {
                        if (controller.model.value.jenis == null) {
                          Flushbar(
                            title: "Error",
                            message: "Jenis Kelamin harus diisi",
                            duration: Duration(seconds: 5),
                            icon: Icon(
                              Icons.do_not_disturb,
                              color: Colors.redAccent,
                            ),
                            flushbarPosition: FlushbarPosition.TOP,
                          )..show(Get.context);
                        }
                        if (controller.model.value.tanggal == null) {
                          Flushbar(
                            title: "Error",
                            message: "Tanggal lahir harus diisi",
                            duration: Duration(seconds: 5),
                            icon: Icon(
                              Icons.do_not_disturb,
                              color: Colors.redAccent,
                            ),
                            flushbarPosition: FlushbarPosition.TOP,
                          )..show(Get.context);
                        }
                        if (controller.model.value.jenis != null &&
                            controller.model.value.tanggal != null) {
                          controller.register(authBloc);
                        }
                      } else {
                        Flushbar(
                          title: "Error",
                          message: "Semua data harus diisi",
                          duration: Duration(seconds: 5),
                          icon: Icon(
                            Icons.do_not_disturb,
                            color: Colors.redAccent,
                          ),
                          flushbarPosition: FlushbarPosition.TOP,
                        )..show(Get.context);
                      }
                    })),
                SizedBox(
                  height: 0.02.sh,
                ),
                Parent(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Sudah Mempunyai Akun? Silahkan ",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed("/login");
                            },
                          text: "Login",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFE1EA37),
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              fontStyle: FontStyle.italic)),
                    ]),
                  ),
                  style: ParentStyle()..alignment.topLeft(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
