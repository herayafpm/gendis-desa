import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/controllers/cari_difabel_controller.dart';
import 'package:gendisdesa/ui/components/header_with_bg_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CariDifabelPage extends GetView<CariDifabelController> {
  final controller = Get.put(CariDifabelController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.25.sh),
        child: AppBar(
          title: Txt("Cari Data Difabel"),
          flexibleSpace: HeaderWithBgComp(),
        ),
      ),
      body: BlocProvider(
        create: (context) => DifabelBloc(),
        child: BodyCariDifabelPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyCariDifabelPage extends StatelessWidget {
  final controller = Get.find<CariDifabelController>();
  // ignore: close_sinks
  DifabelBloc difabelBloc;

  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    return Parent(
      style: ParentStyle()
        ..padding(horizontal: 20)
        ..margin(top: 20),
      child: Form(
        key: controller.formKey,
        child: BlocListener<DifabelBloc, DifabelBlocState>(
          listener: (context, state) {
            controller.isLoading.value = false;
            if (state is DifabelBlocLoading) {
              controller.isLoading.value = true;
            } else if (state is DifabelBlocError) {
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
            } else if (state is DifabelBlocSuccess) {
              controller.isLoading.value = false;
              controller.nikController.clear();
              Flushbar(
                title: "Success",
                message:
                    "NIK: ${controller.nik.value}\nStatus: ${state.data['message']}" ??
                        "",
                duration: Duration(seconds: 5),
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
                height: 0.05.sh,
              ),
              Obx(() => ItemButtonComp(
                  title: "Cari",
                  isLoading: controller.isLoading.value,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (controller.formKey.currentState.validate()) {
                      controller.formKey.currentState.save();
                      controller.cari(difabelBloc);
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
