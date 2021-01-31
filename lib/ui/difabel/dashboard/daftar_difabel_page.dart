import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/controllers/daftar_difabel_controller.dart';
import 'package:gendisdesa/models/difabel_model.dart';
import 'package:gendisdesa/ui/components/header_comp.dart';
import 'package:gendisdesa/ui/components/item_button_comp.dart';
import 'package:gendisdesa/ui/components/item_picker_comp.dart';
import 'package:gendisdesa/ui/difabel/dashboard/daftar_difabel/data_ayah_view.dart';
import 'package:gendisdesa/ui/difabel/dashboard/daftar_difabel/data_ibu_view.dart';
import 'package:gendisdesa/ui/difabel/dashboard/daftar_difabel/identitas_difabel_view.dart';
import 'package:get/get.dart';

class DaftarDifabelPage extends StatelessWidget {
  final controller = Get.put(DaftarDifabelController());
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
              "Pendaftaran Difabel",
              style: TxtStyle()
                ..fontSize(28.sp)
                ..textColor(Colors.white),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocProvider(
                    create: (context) =>
                        DifabelBloc()..add(DifabelGetStaticBlocEvent()),
                    child: BodyPendaftaranDifabelView(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BodyPendaftaranDifabelView extends StatelessWidget {
  final controller = Get.find<DaftarDifabelController>();

  // ignore: close_sinks
  DifabelBloc difabelBloc;
  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    return BlocListener<DifabelBloc, DifabelBlocState>(
      listener: (context, state) {
        controller.isLoading.value = false;
        if (state is DifabelBlocStaticSuccess) {
          controller.listJenisDisabilitas.value =
              state.data['jenis_disabilitas'];
          controller.listAlatBantu.value = state.data['alat_bantu'];
          controller.listFasilitasKesehatan.value =
              state.data['fasilitas_kesehatan'];
          controller.listKeterampilan.value = state.data['keterampilan'];
          controller.listKeterampilan.add({
            "keterampilan_id": "0",
            "keterampilan_nama": "-- TULIS SENDIRI --"
          });
          controller.listOrganisasi.value = state.data['organisasi'];
          controller.listOrganisasi.add(
              {"organisasi_id": "0", "organisasi_nama": "-- TULIS SENDIRI --"});
          controller.listPekerjaan.value = state.data['pekerjaan'];
          controller.listPekerjaan.add(
              {"pekerjaan_id": "0", "pekerjaan_nama": "-- TULIS SENDIRI --"});
          controller.listKebutuhanPelatihan.value =
              state.data['kebutuhan_pelatihan'];
          controller.listKebutuhanPelatihan.add({
            "kebutuhan_pelatihan_id": "0",
            "kebutuhan_pelatihan_nama": "-- TULIS SENDIRI --"
          });
          controller.listKebutuhanPerawatan.value =
              state.data['kebutuhan_perawatan'];
          controller.listKebutuhanPerawatan.add({
            "kebutuhan_perawatan_id": "0",
            "kebutuhan_perawatan_nama": "-- TULIS SENDIRI --"
          });
          controller.listKondisiDifabel.value = state.data['kondisi_difabel'];
          controller.listAgama.value = state.data['agama'];
          controller.listKondisiOrangTua.value =
              state.data['kondisi_orang_tua'];
          if (Get.arguments != null) {
            DifabelModel difabel = Get.arguments as DifabelModel;
            controller.difabel.value = difabel;
            controller.orangtua.value = difabel.orang_tua;
            controller.fillField();
          }
        } else if (state is DifabelBlocSuccess) {
          // if (controller.difabel.value.difabel_id == null) {
          //   controller.clearSuccess();
          // }
          Flushbar(
            title: "Success",
            message: state.data['message'] ?? "",
            duration: Duration(seconds: 5),
            icon: Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
            flushbarPosition: FlushbarPosition.TOP,
            onStatusChanged: (status) {
              if (status == FlushbarStatus.DISMISSED) {
                Get.back();
              }
            },
          )..show(Get.context);
        } else if (state is DifabelBlocError) {
          // if (controller.difabel.value.difabel_id == null) {
          //   controller.clearSuccess();
          // }
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
        }
      },
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            IdentitasDifabelView(),
            SizedBox(
              height: 0.02.sh,
            ),
            DataAyahView(),
            SizedBox(
              height: 0.02.sh,
            ),
            DataIbuView(),
            SizedBox(
              height: 0.02.sh,
            ),
            Obx(() => ItemPickerComp(
                  title: "Kondisi Orang Tua",
                  text: (controller.difabel.value.kondisi_orang_tua_id != null)
                      ? controller.selectedKondisiOrangTua.value
                      : "Kondisi Orang Tua",
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    controller.showKondisiOrangTuaPicker(difabelBloc);
                  },
                )),
            SizedBox(
              height: 0.04.sh,
            ),
            Obx(() => ItemButtonComp(
                title: "Kirim Data",
                isLoading: controller.isLoading.value,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  controller.proses(difabelBloc);
                })),
            SizedBox(
              height: 0.04.sh,
            ),
          ],
        ),
      ),
    );
  }
}
