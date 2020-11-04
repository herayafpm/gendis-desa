import 'dart:async';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final obj = ''.obs;
  @override
  void onInit() {
    splash();
    super.onInit();
  }

  Future splash() async {
    return Timer(Duration(seconds: 9), () async {
      Get.offAllNamed("/home");
    });
  }
}

class SplashScreenPage extends GetView<SplashScreenController> {
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Parent(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Parent(
                      child: Image.asset("assets/images/intro.gif"),
                      style: ParentStyle()
                        ..width(Get.width)
                        ..height(Get.height * 0.5)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Txt(
                    "Gendis Desa Versi 1.0",
                    style: TxtStyle()
                      ..fontSize(24.sp)
                      ..textColor(Colors.black87),
                  ),
                )
              ],
            ),
            style: ParentStyle()
              ..width(1.sw)
              ..height(1.sh)
              ..padding(vertical: 0.05.sh, horizontal: 0.05.sw)));
  }
}
