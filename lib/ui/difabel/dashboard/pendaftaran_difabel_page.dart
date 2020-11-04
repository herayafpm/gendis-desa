import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/ui/components/header_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:get/get.dart';

class PendaftaranDifabelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderComp(),
            SizedBox(
              height: 0.02.sh,
            ),
            Txt(
              "Pendaftaran Difabel",
              style: TxtStyle()
                ..fontSize(28.sp)
                ..textColor(Colors.white),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ItemButtonComp(
                      onTap: () {
                        Get.toNamed("/daftar_difabel");
                      },
                      title: "Mulai Pendaftaran",
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
