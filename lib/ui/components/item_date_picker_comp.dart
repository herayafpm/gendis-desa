import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDatePickerComp extends StatelessWidget {
  final Function onConfirm;
  final DateTime currentDate;
  final String text;
  final String title;

  const ItemDatePickerComp(
      {Key key,
      this.onConfirm,
      this.title = "Tanggal Lahir",
      this.currentDate,
      this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Parent(
      gesture: Gestures()
        ..onTap(() {
          FocusScope.of(context).unfocus();
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(DateTime.now().year - 50, 1, 1),
              maxTime: DateTime(DateTime.now().year + 20, 12, 30),
              onConfirm: onConfirm,
              currentTime: currentDate ?? DateTime.now(),
              locale: LocaleType.id);
        }),
      style: ParentStyle()
        ..background.color(Colors.white)
        ..borderRadius(all: 4)
        ..padding(vertical: 5, horizontal: 4)
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
