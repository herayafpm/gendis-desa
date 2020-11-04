import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/auth/authbloc.dart';
import 'package:gendisdesa/bloc/home/home_bloc.dart';
import 'package:gendisdesa/controllers/home_controller.dart';
import 'package:gendisdesa/ui/components/banner_carousel_comp.dart';
import 'package:gendisdesa/ui/components/header_comp.dart';
import 'package:gendisdesa/ui/components/info_difabel_comp.dart';
import 'package:gendisdesa/ui/components/item_menu_aplikasi.dart';
import 'package:gendisdesa/ui/components/item_menu_home.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomePageController> {
  final controller = Get.put(HomePageController());
  DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: BlocProvider(
              create: (context) => AuthBloc(),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/bg.png",
                        fit: BoxFit.contain,
                      )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      top: 0,
                      child: SafeArea(
                        child: Parent(
                          child: ListView(
                            children: [
                              HeaderComp(
                                paddingHorizontal: 20,
                              ),
                              BodyHomePage()
                            ],
                          ),
                          style: ParentStyle()
                            ..padding(horizontal: 20, top: 10, bottom: 10),
                        ),
                      )),
                ],
              )),
        ));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 3)) {
      currentBackPressTime = now;
      Flushbar(
        title: "Info",
        message: 'Klik dua kali untuk keluar',
        duration: Duration(seconds: 2),
        icon: Icon(
          Icons.info,
          color: Colors.blueAccent,
        ),
        flushbarPosition: FlushbarPosition.BOTTOM,
      )..show(Get.context);
      return Future.value(false);
    }
    return Future.value(true);
  }
}

class BodyHomePage extends GetView<HomePageController> {
  final controller = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeBlocBannerEvent()),
          child: BannerCarouselComp(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeBlocInfoDifabelEvent()),
          child: InfoDifabelComp(),
        ),
        Txt(
          "MENU APLIKASI",
          style: TxtStyle()
            ..margin(vertical: 10)
            ..fontSize(16)
            ..textColor(Colors.white)
            ..fontWeight(FontWeight.w500),
        ),
        Row(
          children: [
            ItemMenuAplikasi(
                title: "MASUK APLIKASI",
                image: "icon_login.png",
                onTap: () {
                  controller.cekLogin("/login");
                }),
            ItemMenuAplikasi(
              title: "LUPA PASSWORD",
              image: "icon_lupapassword.png",
              onTap: () {
                Get.toNamed("/forgotpass");
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            ItemMenuHome(
              title: "DAFTAR AKUN",
              subtitile: "Daftar Jika Belum Punya Akun",
              onTap: () {
                controller.cekLogin("/register");
              },
            ),
            ItemMenuHome(
              title: "Cari Data Difabel",
              subtitile: "Mencari Data Difabel Berdasar NIK",
              onTap: () {
                Get.toNamed('/cari_difabel');
              },
            ),
            ItemMenuHome(
              title: "Kontak Kami",
              onTap: () => showDialogKontakKami(),
            ),
          ],
        )
      ],
    );
  }

  void showDialogKontakKami() {
    showDialog(
        context: (Get.context),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Parent(
            style: ParentStyle()
              ..height(Get.height * 0.45)
              ..width(Get.width * 0.95),
            child: Stack(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      "http://gendisdesa.banyumaskab.go.id/template/user2/images/alamat_dinsos.png",
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(Get.context);
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
