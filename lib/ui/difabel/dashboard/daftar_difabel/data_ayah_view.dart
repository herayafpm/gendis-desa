import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/controllers/daftar_difabel_controller.dart';
import 'package:gendisdesa/ui/components/item_date_picker_comp.dart';
import 'package:gendisdesa/ui/components/item_picker_comp.dart';
import 'package:gendisdesa/ui/components/item_text_field_comp.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataAyahView extends StatelessWidget {
  final controller = Get.find<DaftarDifabelController>();
  // ignore: close_sinks
  DifabelBloc difabelBloc;
  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Column(
      children: [
        Txt("Data Ayah",
            style: TxtStyle()
              ..fontSize(30.sp)
              ..textColor(Colors.white)
              ..textAlign.center()),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nikAyahDifabelController,
            title: "NIK Ayah",
            hint: "Masukkan NIK Ayah (Isi dengan angka 0 jika tidak punya)",
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nokkAyahDifabelController,
            title: "No KK Ayah",
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.namaAyahDifabelController,
            title: "Nama Ayah",
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.tempatlahirAyahDifabelController,
            title: "Tempat Lahir Ayah",
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemDatePickerComp(
              title: "Tanggal Lahir Ayah",
              currentDate: controller.orangtua.value.ayah_tanggal_lahir,
              text: (controller.orangtua.value.ayah_tanggal_lahir != null)
                  ? DateTimeUtils.convert(
                      controller.orangtua.value.ayah_tanggal_lahir)
                  : "Pilih Tanggal Lahir Ayah",
              onConfirm: (date) {
                FocusScope.of(context).unfocus();
                controller.orangtua.update((val) {
                  val.ayah_tanggal_lahir = date;
                });
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Agama Ayah",
              text: (controller.orangtua.value.ayah_agama_id != null)
                  ? controller.selectedAgamaAyah.value
                  : "Pilih Agama Ayah",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showAgamaAyahPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.alamatAyahDifabelController,
            title: "Alamat Ayah",
            hint: "Alamat (Jalan/Perumahan) Sesuai KTP",
            tipe: TextInputType.text,
            expand: true,
            mainExpand: true,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rtAyahDifabelController,
            title: "RT Ayah",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rwAyahDifabelController,
            title: "RW Ayah",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.desaAyahDifabelController,
            title: "Desa Ayah",
            tipe: TextInputType.text,
            onSaved: null,
            mainExpand: true,
            expand: true,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kecamatanAyahDifabelController,
            title: "Kecamatan Ayah",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kabupatenAyahDifabelController,
            title: "Kabupaten Ayah",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.notelpAyahDifabelController,
            title: "No Telp (WA) Ayah",
            tipe: TextInputType.phone,
            onSaved: null,
            validator: null),
      ],
    );
  }
}
