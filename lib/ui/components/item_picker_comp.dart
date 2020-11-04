import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemPickerComp extends StatelessWidget {
  final String text;
  final String title;
  final Function onTap;

  const ItemPickerComp({Key key, this.title = "judul", this.text, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Parent(
      gesture: Gestures()..onTap(onTap),
      style: ParentStyle()
        ..background.color(Colors.white)
        ..borderRadius(all: 4)
        ..padding(vertical: 6, horizontal: 4)
        ..height(0.08.sh)
        ..width(1.sw)
        ..padding(left: 10)
        ..ripple(true, splashColor: Colors.blueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(title,
                  style: TxtStyle()
                    ..alignment.centerLeft()
                    ..fontSize(20.sp)
                    ..textColor(Colors.black)),
              SizedBox(
                height: 0.01.sh,
              ),
              Txt(text,
                  style: TxtStyle()
                    ..alignment.centerLeft()
                    ..fontSize(24.sp)
                    ..textColor(Colors.black54)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.expand_more),
          ),
        ],
      ),
    );
  }
}
