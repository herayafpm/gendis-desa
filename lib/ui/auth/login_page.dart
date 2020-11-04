import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:gendisdesa/controllers/login_controller.dart';
import 'package:gendisdesa/models/user_model.dart';
import 'package:gendisdesa/ui/components/header_with_bg_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class LoginPage extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: AppBar(
          title: Txt("Halaman Login"),
          flexibleSpace: HeaderWithBgComp(),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BodyLoginPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyLoginPage extends StatelessWidget {
  final controller = Get.find<LoginController>();
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
              var usermodelHive = await Hive.openBox("user_model");
              UserModel userModel =
                  UserModel.createFromJson(state.data['data']);
              usermodelHive.add(userModel);
              Flushbar(
                title: "Success",
                message: state.data['message'] ?? "",
                duration: Duration(seconds: 3),
                onStatusChanged: (status) {
                  if (status == FlushbarStatus.DISMISSED) {
                    Get.offNamed("/splash_dashboard");
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
                    return null;
                  }),
              SizedBox(
                height: 0.05.sh,
              ),
              Obx(() => ItemButtonComp(
                  title: "Login",
                  isLoading: controller.isLoading.value,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (controller.formKey.currentState.validate()) {
                      controller.formKey.currentState.save();
                      controller.login(authBloc);
                    }
                  })),
              SizedBox(
                height: 0.05.sh,
              ),
              Parent(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Belum Mempunyai Akun? Silahkan ",
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed("/register");
                          },
                        text: "Registrasi",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFE1EA37),
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: " Dahulu",
                        style: TextStyle(
                          fontSize: 17,
                        ))
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
