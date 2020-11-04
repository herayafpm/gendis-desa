import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/models/difabel_model.dart';
import 'package:gendisdesa/static_data.dart';
import 'package:gendisdesa/ui/components/header_comp.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class RiwayatDifabelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderComp(),
            SizedBox(
              height: 0.02.sh,
            ),
            Txt(
              "Riwayat Pendaftaran Difabel",
              style: TxtStyle()
                ..fontSize(28.sp)
                ..textColor(Colors.white),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Flexible(
              flex: 1,
              child: BlocProvider<DifabelBloc>(
                create: (context) =>
                    DifabelBloc()..add(DifabelGetListBlocEvent()),
                child: BodyRiwayatDifabelView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyRiwayatDifabelView extends StatelessWidget {
  // ignore: close_sinks
  DifabelBloc difabelBloc;

  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    return BlocConsumer<DifabelBloc, DifabelBlocState>(
      listener: (context, state) {
        if (state is DifabelBlocError) {
          Flushbar(
            title: "Error",
            message: state.error ?? "",
            duration: Duration(seconds: 5),
            icon: Icon(
              Icons.do_not_disturb,
              color: Colors.redAccent,
            ),
            flushbarPosition: FlushbarPosition.TOP,
          )..show(Get.context);
        } else if (state is DifabelBlocSuccess) {
          Flushbar(
            title: "Success",
            message: state.data['message'] ?? "",
            duration: Duration(seconds: 5),
            icon: Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
            flushbarPosition: FlushbarPosition.TOP,
          )..show(Get.context);
        }
      },
      builder: (context, state) {
        if (state is DifabelBlocListLoaded) {
          DifabelBlocListLoaded stateData = state;
          if (stateData.difabels.length > 0) {
            return ListRiwayatDifabelView(stateData.difabels);
          } else {
            return Container(
              child: Center(
                  child: Txt(
                "Anda Belum Pernah Melakukan Pendaftaran Difabel",
                style: TxtStyle()
                  ..fontSize(30.sp)
                  ..textColor(Colors.white)
                  ..textAlign.center(),
              )),
            );
          }
        } else if (state is DifabelBlocError) {
          return Container(
            child: Center(
                child: Txt(
              state.error ?? "",
              style: TxtStyle()
                ..fontSize(30.sp)
                ..textColor(Colors.white)
                ..textAlign.center(),
            )),
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              DifabelModel difabel = DifabelModel(difabel_id: index + 1);
              return ItemListRiwayatDifabelView(difabel);
            },
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ListRiwayatDifabelView extends StatelessWidget {
  List<DifabelModel> difabels = [];
  ListRiwayatDifabelView(this.difabels);
  DifabelBloc difabelBloc;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    difabelBloc..add(DifabelGetListBlocEvent(refresh: true));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    difabelBloc..add(DifabelGetListBlocEvent());
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: difabels.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemListRiwayatDifabelView(difabels[index]);
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemListRiwayatDifabelView extends StatelessWidget {
  DifabelBloc difabelBloc;
  DifabelModel difabel;
  ItemListRiwayatDifabelView(this.difabel);
  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    return Parent(
      child: Container(
        child: ListTile(
          onTap: () {
            Get.toNamed("detail_difabel", arguments: difabel);
          },
          leading: Hero(
              tag: 'hero-${difabel.difabel_id}',
              child: GestureDetector(
                onTap: () {
                  if (difabel.difabel_image != null) {
                    Get.toNamed("/image_view", arguments: {
                      "id": difabel.difabel_id,
                      'url':
                          "${StaticData.baseUrl}/uploads/${difabel.difabel_image ?? 'kosong.png'}"
                    });
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl:
                        "${StaticData.baseUrl}/uploads/${difabel.difabel_image ?? 'kosong.png'}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
              )),
          title: Text(difabel.difabel_nama ?? ""),
          subtitle: Text(difabel.difabel_nik ?? ""),
          trailing: Container(
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                if (difabel.sudah_verif == 0) {
                  showDialogItemList(difabel);
                } else {
                  Flushbar(
                    title: "Error",
                    message: "Data ini sudah diverifikasi",
                    duration: Duration(seconds: 5),
                    icon: Icon(
                      Icons.do_not_disturb,
                      color: Colors.redAccent,
                    ),
                    flushbarPosition: FlushbarPosition.TOP,
                  )..show(Get.context);
                }
              },
            ),
          ),
        ),
      ),
      style: ParentStyle()
        ..background.color(Colors.white)
        ..elevation(2)
        ..borderRadius(all: 5)
        ..height(0.08.sh)
        ..margin(horizontal: 0.02.sw, vertical: 0.009.sh),
    );
  }

  void showDialogItemList(DifabelModel difabel) {
    showDialog(
        context: Get.context,
        child: AlertDialog(
          title: Txt("Opsi"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(Get.context);
                  Get.toNamed("/daftar_difabel", arguments: difabel);
                },
                child: Txt("Edit")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(Get.context);
                  confirmDelete(difabel.difabel_id);
                },
                child: Txt("Hapus"))
          ],
        ));
  }

  void confirmDelete(int id) {
    showDialog(
        context: Get.context,
        child: AlertDialog(
          title: Txt("Konfirmasi Hapus Item"),
          content: Txt("Yakin ingin menghapus?"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(Get.context);
                },
                child: Txt("Batal")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(Get.context);
                  difabelBloc.add(DifabelDeleteBlocEvent(id));
                },
                child: Txt("Ya"))
          ],
        ));
  }
}
