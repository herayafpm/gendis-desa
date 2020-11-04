import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemButtonComp extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function onTap;

  const ItemButtonComp(
      {Key key, this.isLoading = false, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: (isLoading == false)
          ? Center(
              child: Txt(
                title,
                style: TxtStyle()
                  ..textAlign.center()
                  ..textColor(Colors.white)
                  ..fontWeight(FontWeight.bold)
                  ..fontSize(18),
              ),
            )
          : Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
      style: ParentStyle()
        ..background.color(Color(0xFF2F88FC))
        ..width(Get.width * 0.5)
        ..height(55)
        ..padding(vertical: 12, horizontal: 12)
        ..borderRadius(all: 10)
        ..elevation((isLoading) ? 0 : 2)
        ..opacity((isLoading) ? 0.8 : 1)
        ..alignment.center(),
      gesture: Gestures()..onTap((isLoading) ? null : onTap),
    );
  }
}
