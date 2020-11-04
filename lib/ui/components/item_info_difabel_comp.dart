import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ItemInfoDifabelComp extends StatelessWidget {
  final int jumlah;
  final Color color;
  final String info;

  const ItemInfoDifabelComp({Key key, this.jumlah, this.color, this.info})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Parent(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                "$jumlah",
                style: TxtStyle()
                  ..fontSize(20)
                  ..textColor(color)
                  ..fontWeight(FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Txt(info)
            ],
          ),
          style: ParentStyle()
            ..background.color(Colors.white)
            ..padding(all: 20)
            ..margin(right: 4)
            ..borderRadius(all: 5)),
    );
  }
}
