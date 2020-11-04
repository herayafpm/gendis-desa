import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/controllers/detail_difabel_controller.dart';
import 'package:gendisdesa/static_data.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:get/get.dart';

class DetailDifabelPage extends StatelessWidget {
  final controller = Get.put(DetailDifabelController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Scaffold(
      body: BlocProvider(
        create: (context) => DifabelBloc()..add(DifabelGetStaticBlocEvent()),
        child: BlocListener<DifabelBloc, DifabelBlocState>(
          listener: (context, state) {
            if (state is DifabelBlocStaticSuccess) {
              controller.staticData(state.data);
            } else if (state is DifabelBlocError) {
              Flushbar(
                title: "Error",
                message: state.error,
                duration: Duration(seconds: 5),
                icon: Icon(
                  Icons.do_not_disturb,
                  color: Colors.redAccent,
                ),
                flushbarPosition: FlushbarPosition.TOP,
              )..show(Get.context);
            }
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 5,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("${controller.difabel.value.difabel_nama}"),
                  background: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Hero(
                            tag: "hero-${controller.difabel.value.difabel_id}",
                            child: CachedNetworkImage(
                              width: 50,
                              height: 50,
                              imageUrl:
                                  "${StaticData.baseUrl}/uploads/${controller.difabel.value.difabel_image ?? 'kosong.png'}",
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Parent(
                            gesture: Gestures()
                              ..onTap(() {
                                Get.toNamed("/image_view", arguments: {
                                  "url":
                                      "${StaticData.baseUrl}/uploads/${controller.difabel.value.difabel_image}",
                                  'id': "${controller.difabel.value.difabel_id}"
                                });
                              }),
                            child: Container(),
                            style: ParentStyle()
                              ..linearGradient(colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.5)
                              ])),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(<Widget>[
                  itemListData("Identitas Difabel", null),
                  itemListData("NIK", controller.difabel.value.difabel_nik),
                  itemListData("No KK", controller.difabel.value.difabel_no_kk),
                  itemListData(
                      "No DTKS", controller.difabel.value.difabel_no_dtks),
                  itemListData("Tempat, Tanggal Lahir",
                      "${controller.difabel.value.difabel_tempat_lahir}, ${DateTimeUtils.convert(controller.difabel.value.difabel_tanggal_lahir)}"),
                  itemListData(
                      "Jenis Kelamin", controller.difabel.value.difabel_jk),
                  Obx(() => itemListData("Agama", controller.agama.value)),
                  itemListData("Alamat Jalan Perumahan",
                      controller.difabel.value.alamat_jalan_perumahan),
                  itemListData("RT", controller.difabel.value.alamat_rt),
                  itemListData("RW", controller.difabel.value.alamat_rw),
                  itemListData("Desa", controller.difabel.value.alamat_desa),
                  itemListData(
                      "Kecamatan", controller.difabel.value.alamat_kecamatan),
                  itemListData(
                      "Kabupaten", controller.difabel.value.alamat_kabupaten),
                  itemListData("No Telepon (WA)",
                      controller.difabel.value.alamat_telepon),
                  Obx(() => itemListData(
                      "Jenis Disabilitas", controller.jenis_disabilitas.value)),
                  Obx(() =>
                      itemListData("Alat Bantu", controller.alat_bantu.value)),
                  Obx(() => itemListData("Fasilitas Kesehatan",
                      controller.fasilitas_kesehatan.value)),
                  Obx(() => itemListData(
                      "Keterampilan", controller.keterampilan.value)),
                  itemListData("Keterampilan Lainnya",
                      controller.difabel.value.difabel_keterampilan_lainnya),
                  Obx(() =>
                      itemListData("Organisasi", controller.organisasi.value)),
                  itemListData("Organisasi Lainnya",
                      controller.difabel.value.difabel_organisasi_lainnya),
                  Obx(() =>
                      itemListData("Pekerjaan", controller.pekerjaan.value)),
                  itemListData("Pekerjaan Lainnya",
                      controller.difabel.value.difabel_pekerjaan_lainnya),
                  Obx(() => itemListData("Kebutuhan Pelatihan",
                      controller.kebutuhan_pelatihan.value)),
                  itemListData("Kebutuhan Pelatihan Lainnya",
                      controller.difabel.value.difabel_pelatihan_lainnya),
                  Obx(() => itemListData("Kebutuhan Perawatan",
                      controller.kebutuhan_perawatan.value)),
                  itemListData("Kebutuhan Perawatan Lainnya",
                      controller.difabel.value.difabel_perawatan_lainnya),
                  Obx(() => itemListData(
                      "Kondisi Difabel", controller.kondisi_difabel.value)),
                  Obx(() => itemListData(
                      "Kondisi Orang Tua", controller.kondisi_orang_tua.value)),
                  itemListData("Difabel Permasalahan",
                      controller.difabel.value.difabel_permasalahan),
                  itemListData(
                      "Status Verifikasi",
                      (controller.difabel.value.sudah_verif == 1)
                          ? "Sudah"
                          : "Belum"),
                  itemListData("Data Ayah", null),
                  itemListData("Nama Ayah",
                      controller.difabel.value.orang_tua.ayah_nama),
                  itemListData(
                      "NIK Ayah", controller.difabel.value.orang_tua.ayah_nik),
                  itemListData("NO KK Ayah",
                      controller.difabel.value.orang_tua.ayah_no_kk),
                  itemListData("Tempat, Tanggal Lahir Ayah",
                      "${controller.difabel.value.orang_tua.ayah_tempat_lahir}, ${DateTimeUtils.convert(controller.difabel.value.orang_tua.ayah_tanggal_lahir)}"),
                  Obx(() =>
                      itemListData("Agama Ayah", controller.agama_ayah.value)),
                  itemListData(
                      "Alamat Jalan Perumahan Ayah",
                      controller
                          .difabel.value.orang_tua.ayah_alamat_jalan_perumahan),
                  itemListData("RT Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_rt),
                  itemListData("RW Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_rw),
                  itemListData("Desa Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_desa),
                  itemListData("Kecamatan Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_kecamatan),
                  itemListData("Kabupaten Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_kabupaten),
                  itemListData("No Telepon (WA) Ayah",
                      controller.difabel.value.orang_tua.ayah_alamat_telepon),
                  itemListData("Data Ibu", null),
                  itemListData(
                      "Nama Ibu", controller.difabel.value.orang_tua.ibu_nama),
                  itemListData(
                      "NIK Ibu", controller.difabel.value.orang_tua.ibu_nik),
                  itemListData("NO KK Ibu",
                      controller.difabel.value.orang_tua.ibu_no_kk),
                  itemListData("Tempat, Tanggal Lahir Ibu",
                      "${controller.difabel.value.orang_tua.ibu_tempat_lahir}, ${DateTimeUtils.convert(controller.difabel.value.orang_tua.ibu_tanggal_lahir)}"),
                  Obx(() =>
                      itemListData("Agama Ibu", controller.agama_ibu.value)),
                  itemListData(
                      "Alamat Jalan Perumahan Ibu",
                      controller
                          .difabel.value.orang_tua.ibu_alamat_jalan_perumahan),
                  itemListData("RT Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_rt),
                  itemListData("RW Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_rw),
                  itemListData("Desa Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_desa),
                  itemListData("Kecamatan Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_kecamatan),
                  itemListData("Kabupaten Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_kabupaten),
                  itemListData("No Telepon (WA) Ibu",
                      controller.difabel.value.orang_tua.ibu_alamat_telepon),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemListData(String title, String subtitle) {
    return Parent(
        child: ListTile(
          title: Text(
            title,
            textAlign: (subtitle.isNull) ? TextAlign.center : TextAlign.left,
          ),
          subtitle: Text(subtitle ?? ""),
        ),
        style: ParentStyle()
          ..background.color(Colors.white)
          ..height(0.08.sh));
  }
}
