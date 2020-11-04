import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:gendisdesa/controllers/akun_controller.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:get/get.dart';

class AkunPage extends StatelessWidget {
  final controller = Get.put(AkunController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => (controller.akun.value.isNull)
          ? Container()
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Txt("Profile Akun",
                          style: TxtStyle()
                            ..textColor(Colors.white)
                            ..fontSize(16)),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Txt("Nama ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt(controller.akun.value.nama ?? "",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Txt("NIK ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt(controller.akun.value.nik ?? "",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Txt("Tempat, Tanggal Lahir ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt(
                            "${controller.akun.value.tempat ?? ""}, ${(DateTimeUtils.convert(controller.akun.value.tanggal)) ?? ""}",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Txt("Jenis Kelamin ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt("${controller.akun.value.jenis}",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Txt("Alamat ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt(
                            (controller.akun.value.desa == null)
                                ? ""
                                : "${controller.akun.value.desa} RT ${controller.akun.value.rt} RW ${controller.akun.value.rw} ${controller.akun.value.kecamatan} ${controller.akun.value.kabupaten} ${controller.akun.value.provinsi}",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      ListTile(
                        title: Txt("No Telepon (WA) ",
                            style: TxtStyle()..textColor(Colors.white)),
                        subtitle: Txt(controller.akun.value.no_telp ?? "",
                            style: TxtStyle()..textColor(Colors.white70)),
                        isThreeLine: true,
                      ),
                      Txt("Menu Akun",
                          style: TxtStyle()
                            ..textColor(Colors.white)
                            ..fontSize(16)),
                      SizedBox(
                        height: 20,
                      ),
                      buttonMenuAkun("Ubah Password", Color(0xFF2F88FC), () {
                        Get.toNamed("/ubah_pass");
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      buttonMenuAkun("Logout Akun", Color(0xFFEA212E), () {
                        showDialogLogout(context);
                      })
                    ],
                  ),
                ),
              ),
            )),
    );
  }

  void showDialogLogout(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Txt("Konfirmasi"),
          content: Txt("Yakin ingin Keluar?"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Txt("Tidak")),
            FlatButton(
                onPressed: () {
                  controller.logout();
                },
                child: Txt("Ya"))
          ],
        ));
  }

  Widget buttonMenuAkun(String title, Color color, Function onTap) {
    return Parent(
      child: Container(
        child: Txt(
          title,
          style: TxtStyle()
            ..textAlign.center()
            ..textColor(Colors.white)
            ..fontSize(15)
            ..fontWeight(FontWeight.bold),
        ),
      ),
      style: ParentStyle()
        ..padding(vertical: 20)
        ..width(Get.width)
        ..height(60)
        ..background.color(color)
        ..borderRadius(all: 10)
        ..elevation(2),
      gesture: Gestures()..onTap(onTap),
    );
  }
}
