import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ItemMenuAplikasi extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;

  const ItemMenuAplikasi({Key key, this.title, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Parent(
        gesture: Gestures()..onTap(onTap),
        child: Column(
          children: [
            Parent(
                child: Container(
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/$image",
                    ),
                    borderRadius: BorderRadius.circular(500),
                  ),
                ),
                style: ParentStyle()..height(100)),
            SizedBox(
              height: 5,
            ),
            Txt(
              title,
              style: TxtStyle()..fontSize(15),
            )
          ],
        ),
        style: ParentStyle()
          ..background.color(Colors.white)
          ..borderRadius(all: 10)
          ..margin(right: 4)
          ..padding(all: 10)
          ..ripple(true, splashColor: Colors.blueAccent[200])
          ..elevation(3),
      ),
    );
  }
}
