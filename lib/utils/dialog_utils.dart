import 'package:division/division.dart';
import 'package:flutter/material.dart';

abstract class DialogUtils {
  static void noConnection(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Txt("Anda tidak memiliki koneksi internet"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Txt("Ok"))
          ],
        ));
  }

  static void widgetClient(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: widget,
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Txt("Ok"))
          ],
        ));
  }

  static void errorClient(BuildContext context, String message) {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Txt(message),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Txt("Ok"))
          ],
        ));
  }
}
