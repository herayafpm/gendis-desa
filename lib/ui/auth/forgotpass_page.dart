import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:gendisdesa/controllers/forgotpass_controller.dart';
import 'package:gendisdesa/ui/components/header_with_bg_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ForgotPassPage extends GetView<ForgotPassController> {
  final controller = Get.put(ForgotPassController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: AppBar(
          title: Txt("Halaman Lupa Password"),
          flexibleSpace: HeaderWithBgComp(),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BodyForgotPassPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyForgotPassPage extends StatelessWidget {
  final controller = Get.find<ForgotPassController>();
  // ignore: close_sinks
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    return Parent(
      style: ParentStyle()
        ..padding(horizontal: 20)
        ..margin(top: 20),
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
              controller.isLoading.value = false;
              controller.nikController.clear();
              controller.passwordController.clear();
              controller.password2Controller.clear();
              Flushbar(
                title: "Success",
                message:
                    "${state.data['message']}, akan diarahkan ke halaman login",
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
                  onSaved: (value) => controller.nik.value = value,
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
                  controller: controller.passwordController,
                  title: "Password",
                  tipe: TextInputType.text,
                  obsecure: true,
                  onSaved: (value) => controller.password.value = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if (value.length < 6) {
                      return "Password harus lebih dari 6 karakter";
                    }
                    if (value != controller.password2Controller.text) {
                      return "Password dan Konfirmasi Password tidak sama";
                    }
                    return null;
                  }),
              SizedBox(
                height: 0.01.sh,
              ),
              ItemTextFieldComp(
                  controller: controller.password2Controller,
                  title: "Konfirmasi Password",
                  tipe: TextInputType.text,
                  obsecure: true,
                  onSaved: (value) => controller.password2.value = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Konfirmasi Password tidak boleh kosong";
                    }
                    if (value.length < 6) {
                      return "Konfirmasi Password harus lebih dari 6 karakter";
                    }
                    if (value != controller.passwordController.text) {
                      return "Password dan Konfirmasi Password tidak sama";
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
                      controller.formKey.currentState.save();
                      controller.forgotpass(authBloc);
                    }
                  })),
              SizedBox(
                height: 0.05.sh,
              ),
              Parent(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Sudah ingat? Silahkan ",
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
                            fontStyle: FontStyle.italic))
                  ]),
                ),
                style: ParentStyle()..alignment.topLeft(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
