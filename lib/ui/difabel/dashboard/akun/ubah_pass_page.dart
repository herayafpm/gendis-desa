import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:gendisdesa/controllers/ubah_pass_controller.dart';
import 'package:gendisdesa/ui/components/header_with_bg_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UbahPassPage extends GetView<UbahPassController> {
  final controller = Get.put(UbahPassController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: AppBar(
          title: Txt("Halaman Ubah Password"),
          flexibleSpace: HeaderWithBgComp(),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BodyChangePassPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyChangePassPage extends StatelessWidget {
  final controller = Get.find<UbahPassController>();
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
              controller.oldpasswordController.clear();
              controller.newpasswordController.clear();
              Flushbar(
                title: "Success",
                message: state.data['message'],
                duration: Duration(seconds: 5),
                onStatusChanged: (status) {
                  if (status == FlushbarStatus.DISMISSED) {
                    Get.back();
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
                  controller: controller.oldpasswordController,
                  title: "Password Sekarang",
                  tipe: TextInputType.text,
                  obsecure: true,
                  onSaved: (value) => controller.oldpassword.value = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password Sekarang tidak boleh kosong";
                    }
                    if (value.length < 6) {
                      return "Password harus lebih dari 6 karakter";
                    }
                    return null;
                  }),
              SizedBox(
                height: 0.01.sh,
              ),
              ItemTextFieldComp(
                  controller: controller.newpasswordController,
                  title: "Password Baru",
                  tipe: TextInputType.text,
                  obsecure: true,
                  onSaved: (value) => controller.newpassword.value = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password Baru tidak boleh kosong";
                    }
                    if (value.length < 6) {
                      return "Password harus lebih dari 6 karakter";
                    }
                    return null;
                  }),
              SizedBox(
                height: 0.01.sh,
              ),
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
                      controller.changePass(authBloc);
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
