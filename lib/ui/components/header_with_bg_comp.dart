import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWithBgComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: Parent(
              child: Container(
                child: Image.network(
                  "http://gendisdesa.banyumaskab.go.id/template/user2/images/kantorbupatibms.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              style: ParentStyle(),
            ),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: Parent(
              child: Container(),
              style: ParentStyle()
                ..background.color(Color(0xFF2F89FC))
                ..opacity(0.8),
            ),
          )
        ],
      ),
    );
  }
}
