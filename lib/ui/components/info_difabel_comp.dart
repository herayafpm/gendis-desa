import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gendisdesa/bloc/home/home_bloc.dart';
import 'package:gendisdesa/ui/components/item_info_difabel_comp.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class InfoDifabelComp extends StatelessWidget {
  // ignore: close_sinks
  HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeBlocState>(builder: (context, state) {
      Map<String, dynamic> data = Map<String, dynamic>();
      data['verifikasi'] = 0;
      data['terdaftar'] = 0;
      if (state is HomeBlocStateError) {
        return infoData(data);
      } else if (state is HomeBlocInfoDifabelSuccess) {
        HomeBlocInfoDifabelSuccess dataBloc = state;
        data['verifikasi'] = dataBloc.verifikasi;
        data['terdaftar'] = dataBloc.terdaftar;
        return infoData(data);
      }
      return Shimmer.fromColors(
        baseColor: Color(0xFFB2BEC3),
        highlightColor: Color(0xFFDFE6E9),
        child: infoData(data),
      );
    });
  }

  Widget infoData(Map<String, dynamic> info) {
    return Parent(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(
              "Informasi Data Difabel",
              style: TxtStyle(),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                ItemInfoDifabelComp(
                  jumlah: info['terdaftar'],
                  color: Colors.red,
                  info: "TERDAFTAR",
                ),
                ItemInfoDifabelComp(
                  jumlah: info['verifikasi'],
                  color: Colors.green,
                  info: "TERVERIFIKASI",
                ),
              ],
            ),
          ],
        ),
      ),
      style: ParentStyle()
        ..width(Get.width)
        ..background.color(Color(0xFFFFF176))
        ..elevation(1)
        ..borderRadius(all: 10)
        ..margin(top: 10)
        ..padding(horizontal: 20, top: 10, bottom: 20),
    );
  }
}
