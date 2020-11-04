import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderComp extends StatelessWidget {
  final double paddingHorizontal;

  const HeaderComp({Key key, this.paddingHorizontal = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: (paddingHorizontal == 0) ? 20 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Parent(
            child: Container(
              child: Image.asset(
                "assets/images/tulisan_gendis.png",
              ),
            ),
            style: ParentStyle()
              ..width(Get.width * 0.5)
              ..height(70),
          ),
          Parent(
            child: Container(
              child: Image.asset(
                "assets/images/logobms.png",
              ),
            ),
            style: ParentStyle()
              ..width(Get.width * 0.2)
              ..height(70),
          ),
        ],
      ),
    );
  }
}
