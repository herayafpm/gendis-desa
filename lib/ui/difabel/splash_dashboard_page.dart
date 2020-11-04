import 'dart:async';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashDashboardController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 1), () {
      Get.offNamed("/dashboard");
    });
    super.onInit();
  }
}

class SplashDashboardPage extends StatelessWidget {
  final controller = Get.put(SplashDashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69B4CB),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                  child: Image.asset(
                "assets/images/ic_gendis.png",
              ))),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height * 0.2,
            child: Parent(
                child: Column(
                  children: [
                    Txt(
                      "Gerbang Penyandang",
                      style: TxtStyle()
                        ..fontSize(25)
                        ..textColor(Colors.white)
                        ..letterSpacing(1.2),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      "Disabilitas",
                      style: TxtStyle()
                        ..fontSize(25)
                        ..textColor(Colors.white)
                        ..letterSpacing(1.2),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      "Sukses Desa",
                      style: TxtStyle()
                        ..fontSize(25)
                        ..letterSpacing(1.2),
                    ),
                  ],
                ),
                style: ParentStyle()
                  ..width(Get.width)
                  ..height(Get.height * 0.5)),
          )
        ],
      ),
    );
  }
}
