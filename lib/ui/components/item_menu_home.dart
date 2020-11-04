import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ItemMenuHome extends StatelessWidget {
  final String title;
  final String subtitile;
  final Function onTap;

  const ItemMenuHome({Key key, this.title, this.subtitile = '', this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onTap),
      style: ParentStyle()
        ..background.color(Color(0xFFFFF176))
        ..borderRadius(all: 10)
        ..margin(vertical: 5)
        ..ripple(true, splashColor: Colors.white)
        ..elevation(4),
      child: ListTile(
        leading: iconBullet(),
        title: Txt(title),
        subtitle: (subtitile.isNotEmpty) ? Txt(subtitile) : null,
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget iconBullet() {
    return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle));
  }
}
