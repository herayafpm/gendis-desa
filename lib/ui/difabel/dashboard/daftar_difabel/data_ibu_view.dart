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
class DataIbuView extends StatelessWidget {
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
        Txt("Data Ibu",
            style: TxtStyle()
              ..fontSize(30.sp)
              ..textColor(Colors.white)
              ..textAlign.center()),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nikIbuDifabelController,
            title: "NIK Ibu",
            hint: "Masukkan NIK Ibu (Isi dengan angka 0 jika tidak punya)",
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nokkIbuDifabelController,
            title: "No KK Ibu",
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.namaIbuDifabelController,
            title: "Nama Ibu",
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.tempatlahirIbuDifabelController,
            title: "Tempat Lahir Ibu",
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemDatePickerComp(
              title: "Tanggal Lahir Ibu",
              currentDate: controller.orangtua.value.ibu_tanggal_lahir,
              text: (controller.orangtua.value.ibu_tanggal_lahir != null)
                  ? DateTimeUtils.convert(
                      controller.orangtua.value.ibu_tanggal_lahir)
                  : "Pilih Tanggal Lahir Ibu",
              onConfirm: (date) {
                FocusScope.of(context).unfocus();
                controller.orangtua.update((val) {
                  val.ibu_tanggal_lahir = date;
                });
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Agama Ibu",
              text: (controller.orangtua.value.ibu_agama_id != null)
                  ? controller.selectedAgamaIbu.value
                  : "Pilih Agama Ibu",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showAgamaIbuPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.alamatIbuDifabelController,
            title: "Alamat Ibu",
            hint: "Alamat (Jalan/Perumahan) Sesuai KTP",
            tipe: TextInputType.text,
            expand: true,
            mainExpand: true,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rtIbuDifabelController,
            title: "RT Ibu",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rwIbuDifabelController,
            title: "RW Ibu",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.desaIbuDifabelController,
            title: "Desa Ibu",
            tipe: TextInputType.text,
            onSaved: null,
            mainExpand: true,
            expand: true,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kecamatanIbuDifabelController,
            title: "Kecamatan Ibu",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kabupatenIbuDifabelController,
            title: "Kabupaten Ibu",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.notelpIbuDifabelController,
            title: "No Telp (WA) Ibu",
            tipe: TextInputType.phone,
            onSaved: null,
            validator: null),
      ],
    );
  }
}
