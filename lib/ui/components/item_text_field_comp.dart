import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ItemTextFieldComp extends StatelessWidget {
  final Function validator;
  final Function onSaved;
  final String title;
  final String hint;
  final TextInputType tipe;
  final TextEditingController controller;
  final bool obsecure;
  final int lines;
  final bool expand;
  final bool mainExpand;

  ItemTextFieldComp(
      {Key key,
      this.validator,
      this.onSaved,
      this.title,
      this.hint,
      this.controller,
      this.lines = 1,
      this.expand = false,
      this.mainExpand = false,
      this.obsecure = false,
      this.tipe = TextInputType.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..background.color(Colors.white)
        ..borderRadius(
            topLeft: (expand == false)
                ? 4
                : (mainExpand)
                    ? 4
                    : 0,
            topRight: (expand == false)
                ? 4
                : (mainExpand)
                    ? 4
                    : 0,
            bottomLeft: (expand == false) ? 4 : 0,
            bottomRight: (expand == false) ? 4 : 0)
        ..padding(vertical: 5, horizontal: 4),
      child: TextFormField(
          maxLines: lines,
          controller: controller,
          keyboardType: tipe,
          validator: validator,
          onSaved: onSaved,
          obscureText: obsecure,
          cursorColor: Colors.black54,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(4.0),
                  borderSide: new BorderSide(color: Colors.white, width: 4)),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(4.0),
                  borderSide: new BorderSide(color: Colors.white, width: 4)),
              labelText: title,
              hintText: hint ?? "Masukkan $title",
              hintStyle: TextStyle(color: Colors.black54))),
    );
  }
}
