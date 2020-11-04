import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gendisdesa/bloc/home/home_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class BannerCarouselComp extends StatelessWidget {
  // ignore: close_sinks
  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeBlocState>(builder: (context, state) {
      List<String> banners = [];
      if (state is HomeBlocStateError) {
        return Parent(
          style: ParentStyle()
            ..background.color(Theme.of(context).scaffoldBackgroundColor)
            ..elevation(3)
            ..borderRadius(all: 10)
            ..margin(top: 10)
            ..width(Get.width)
            ..height(Get.height * 0.3)
            ..alignment.center(),
          child: Container(
            child: Center(
              child: Txt(
                "Periksa Sambungan Koneksi Anda!",
                style: TxtStyle()
                  ..textColor(Colors.white)
                  ..fontSize(30),
              ),
            ),
          ),
        );
      } else if (state is HomeBlocBannerSuccess) {
        HomeBlocBannerSuccess bannerBloc = state;
        banners.addAll(bannerBloc.banners.map((e) => e.toString()).toList());
        return Parent(
          style: ParentStyle()
            ..background.color(Theme.of(context).scaffoldBackgroundColor)
            ..elevation(3)
            ..borderRadius(all: 10)
            ..margin(top: 10)
            ..width(Get.width)
            ..height(Get.height * 0.3)
            ..alignment.center(),
          child: carouselBanner(context, banners),
        );
      }
      return Parent(
        style: ParentStyle()
          ..background.color(Theme.of(context).scaffoldBackgroundColor)
          ..elevation(3)
          ..borderRadius(all: 10)
          ..margin(top: 10)
          ..width(Get.width)
          ..height(Get.height * 0.3)
          ..alignment.center(),
        child: Shimmer.fromColors(
          baseColor: Color(0xFFB2BEC3),
          highlightColor: Color(0xFFDFE6E9),
          child: carouselBanner(context, banners),
        ),
      );
    });
  }

  Widget carouselBanner(BuildContext context, List<String> banners) {
    return Parent(
      style: ParentStyle()
        ..background.color(Theme.of(context).scaffoldBackgroundColor)
        ..elevation(3)
        ..borderRadius(all: 10)
        ..margin(top: 10)
        ..width(Get.width)
        ..alignment.center(),
      child: (banners.length > 0)
          ? CarouselSlider(
              options: CarouselOptions(
                  height: Get.height * 0.3,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlay: true,
                  enableInfiniteScroll: true),
              items: banners.map((url) {
                return GestureDetector(
                    onTap: () {
                      showDialogCarousel(context, url);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: url,
                        placeholder: (context, url) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidget: (context, url, error) => Center(
                          child: Txt("Gagal mendapatkan gambar banner",
                              style: TxtStyle()
                                ..fontSize(20)
                                ..textColor(Colors.white)
                                ..textAlign.center()),
                        ),
                      ),
                    ));
              }).toList(),
            )
          : Container(),
    );
  }

  void showDialogCarousel(BuildContext context, String url) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
                content: Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: url,
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) => Center(
                      child: Txt("Gagal mendapatkan gambar banner",
                          style: TxtStyle()
                            ..fontSize(20)
                            ..textColor(Colors.white)
                            ..textAlign.center()),
                    ),
                  ),
                )));
  }
}
