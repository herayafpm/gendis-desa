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
class IdentitasDifabelView extends StatelessWidget {
  final controller = Get.find<DaftarDifabelController>();
  // ignore: close_sinks
  DifabelBloc difabelBloc;
  @override
  Widget build(BuildContext context) {
    difabelBloc = BlocProvider.of<DifabelBloc>(context);
    ScreenUtil.init(context,
        designSize: Size(640, 360), allowFontScaling: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemTextFieldComp(
            controller: controller.nikDifabelController,
            title: "NIK Difabel",
            hint: "Masukkan NIK (Isi dengan angka 0 jika tidak punya)",
            tipe: TextInputType.number,
            onSaved: null,
            validator: (value) {
              if (value.isEmpty) {
                return "NIK Difabel tidak boleh kosong, isi dengan 0 jika tidak ada";
              }
              return null;
            }),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nokkDifabelController,
            title: "No KK Difabel",
            tipe: TextInputType.number,
            onSaved: null,
            validator: (value) {
              if (value.isEmpty) {
                return "No KK Difabel Tidak boleh kosong, isi dengan 0 jika tidak ada";
              }
              return null;
            }),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.namaDifabelController,
            title: "Nama Difabel",
            tipe: TextInputType.text,
            onSaved: null,
            validator: (value) {
              if (value.isEmpty) {
                return "Nama Difabel tidak boleh kosong";
              }
              return null;
            }),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.tempatlahirDifabelController,
            title: "Tempat Lahir Difabel",
            tipe: TextInputType.text,
            onSaved: null,
            validator: (value) {
              if (value.isEmpty) {
                return "Tempat Lahir Difabel tidak boleh kosong";
              }
              return null;
            }),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemDatePickerComp(
              currentDate: controller.difabel.value.difabel_tanggal_lahir,
              text: (controller.difabel.value.difabel_tanggal_lahir != null)
                  ? DateTimeUtils.convert(
                      controller.difabel.value.difabel_tanggal_lahir)
                  : "Pilih Tanggal Lahir",
              onConfirm: (date) {
                FocusScope.of(context).unfocus();
                controller.difabel.update((val) {
                  val.difabel_tanggal_lahir = date;
                });
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Jenis Kelamin",
              text: (controller.difabel.value.difabel_jk != null)
                  ? controller.difabel.value.difabel_jk
                  : "Pilih Jenis Kelamin",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showJenisKelaminPicker();
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Agama",
              text: (controller.difabel.value.agama_id != null)
                  ? controller.selectedAgamaDifabel.value
                  : "Pilih Agama",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showAgamaDifabelPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.alamatDifabelController,
            title: "Alamat Difabel",
            hint: "Alamat Difabel (Jalan/Perumahan) Sesuai KTP",
            tipe: TextInputType.text,
            expand: true,
            mainExpand: true,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rtDifabelController,
            title: "RT Difabel",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.rwDifabelController,
            title: "RW Difabel",
            expand: true,
            tipe: TextInputType.number,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.desaDifabelController,
            title: "Desa Difabel",
            tipe: TextInputType.text,
            onSaved: null,
            mainExpand: true,
            expand: true,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kecamatanDifabelController,
            title: "Kecamatan Difabel",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        ItemTextFieldComp(
            controller: controller.kabupatenDifabelController,
            title: "Kabupaten Difabel",
            expand: true,
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.notelpDifabelController,
            title: "No Telp (WA) Difabel",
            tipe: TextInputType.phone,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.nodtksDifabelController,
            title: "No DTKS",
            tipe: TextInputType.text,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.01.sh,
        ),
        Txt(
          "Jika tidak mempunyai NO. DTKS silahkan lewati",
          style: TxtStyle()
            ..fontSize(26.sp)
            ..textColor(Colors.white),
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Jenis Disabilitas",
              text: (controller.difabel.value.jenis_disabilitas_id != null)
                  ? controller.selectedJenisDisabilitas.value
                  : "Pilih Jenis Disabilitas",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showJenisDisabilitasPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Alat Bantu",
              text: (controller.difabel.value.alat_bantu_id != null)
                  ? controller.selectedAlatBantu.value
                  : "Alat Bantu Yang Digunakan",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showAlatBantuPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Fasilitas Kesehatan",
              text: (controller.difabel.value.fasilitas_kesehatan_id != null)
                  ? controller.selectedFasilitasKesehatan.value
                  : "Fasilitas Kesehatan",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showFasilitasKesehatanPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => ItemPickerComp(
              title: "Keterampilan",
              text: (controller.difabel.value.keterampilan_id != null)
                  ? controller.selectedKeterampilan.value
                  : "Keterampilan Yang Dimiliki",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showKeterampilanPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => (controller.difabel.value.keterampilan_id != null &&
                controller.difabel.value.keterampilan_id == 0)
            ? Column(
                children: [
                  ItemTextFieldComp(
                      controller:
                          controller.keterampilanlainnyaDifabelController,
                      title: "Keterampilan Lainnya",
                      tipe: TextInputType.text,
                      onSaved: null,
                      validator: null),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                ],
              )
            : Container()),
        Obx(() => ItemPickerComp(
              title: "Organisasi",
              text: (controller.difabel.value.organisasi_id != null)
                  ? controller.selectedOrganisasi.value
                  : "Organisasi Yang Diikuti",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showOrganisasiPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => (controller.difabel.value.organisasi_id != null &&
                controller.difabel.value.organisasi_id == 0)
            ? Column(
                children: [
                  ItemTextFieldComp(
                      controller: controller.organisasilainnyaDifabelController,
                      title: "Organisasi Lainnya",
                      tipe: TextInputType.text,
                      onSaved: null,
                      validator: null),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                ],
              )
            : Container()),
        Obx(() => ItemPickerComp(
              title: "Pekerjaan",
              text: (controller.difabel.value.pekerjaan_id != null)
                  ? controller.selectedPekerjaan.value
                  : "Pekerjaan",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showPekerjaanPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => (controller.difabel.value.pekerjaan_id != null &&
                controller.difabel.value.pekerjaan_id == 0)
            ? Column(
                children: [
                  ItemTextFieldComp(
                      controller: controller.pekerjaanlainnyaDifabelController,
                      title: "Pekerjaan Lainnya",
                      tipe: TextInputType.text,
                      onSaved: null,
                      validator: null),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                ],
              )
            : Container()),
        Obx(() => ItemPickerComp(
              title: "Kebutuhan Pelatihan",
              text: (controller.difabel.value.kebutuhan_pelatihan_id != null)
                  ? controller.selectedKebutuhanPelatihan.value
                  : "Kebutuhan Pelatihan Keterampilan",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showKebutuhanPelatihanPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => (controller.difabel.value.kebutuhan_pelatihan_id != null &&
                controller.difabel.value.kebutuhan_pelatihan_id == 0)
            ? Column(
                children: [
                  ItemTextFieldComp(
                      controller:
                          controller.kebutuhanpelatihanlainnyaDifabelController,
                      title: "Kebutuhan Pelatihan Keterampilan Lainnya",
                      tipe: TextInputType.text,
                      onSaved: null,
                      validator: null),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                ],
              )
            : Container()),
        Obx(() => ItemPickerComp(
              title: "Kebutuhan Perawatan",
              text: (controller.difabel.value.kebutuhan_perawatan_id != null)
                  ? controller.selectedKebutuhanPerawatan.value
                  : "Kebutuhan Perawatan Medis / Psikologi",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showKebutuhanPerawatanPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        Obx(() => (controller.difabel.value.kebutuhan_perawatan_id != null &&
                controller.difabel.value.kebutuhan_perawatan_id == 0)
            ? Column(
                children: [
                  ItemTextFieldComp(
                      controller:
                          controller.kebutuhanperawatanlainnyaDifabelController,
                      title: "Kebutuhan Perawatan Lainnya",
                      tipe: TextInputType.text,
                      onSaved: null,
                      validator: null),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                ],
              )
            : Container()),
        Obx(() => ItemPickerComp(
              title: "Kondisi difabel",
              text: (controller.difabel.value.kondisi_difabel_id != null)
                  ? controller.selectedKondisiDifabel.value
                  : "Kondisi Difabel",
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showKondisiDifabelPicker(difabelBloc);
              },
            )),
        SizedBox(
          height: 0.02.sh,
        ),
        ItemTextFieldComp(
            controller: controller.permasalahanDifabelController,
            title: "Permasalahan Yang Dihadapi",
            tipe: TextInputType.text,
            lines: 10,
            onSaved: null,
            validator: null),
        SizedBox(
          height: 0.02.sh,
        ),
        Txt(
          "Upload Foto",
          style: TxtStyle()
            ..fontSize(26.sp)
            ..textColor(Colors.white),
        ),
        SizedBox(
          height: 0.01.sh,
        ),
        Txt(
          "*tipe file harus jpg atau png",
          style: TxtStyle()
            ..fontSize(24.sp)
            ..textColor(Colors.white),
        ),
        SizedBox(
          height: 0.01.sh,
        ),
        Txt(
          "*ukuran file maksimal 2 MB",
          style: TxtStyle()
            ..fontSize(24.sp)
            ..textColor(Colors.white),
        ),
        SizedBox(
          height: 0.01.sh,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Parent(
                gesture: Gestures()
                  ..onTap(() {
                    FocusScope.of(context).unfocus();
                    controller.loadAssets();
                  }),
                child: Center(
                  child: Txt(
                    "Pilih File",
                    style: TxtStyle()
                      ..fontSize(24.sp)
                      ..textColor(Colors.black87),
                  ),
                ),
                style: ParentStyle()
                  ..background.color(Colors.white)
                  ..height(40)
                  ..elevation(4)
                  ..borderRadius(all: 4)
                  ..ripple(true, splashColor: Colors.blueAccent),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: Obx(() =>
                  (controller.difabel.value.difabel_image != null &&
                          controller.difabel.value.difabel_image != "")
                      ? Parent(
                          gesture: Gestures()
                            ..onTap(() {
                              FocusScope.of(context).unfocus();
                              controller.showImage();
                            }),
                          child: Center(
                            child: Txt(
                              "Tampilkan Difabel Image",
                              style: TxtStyle()
                                ..fontSize(24.sp)
                                ..textColor(Colors.black87),
                            ),
                          ),
                          style: ParentStyle()
                            ..background.color(Colors.white)
                            ..height(40)
                            ..elevation(4)
                            ..borderRadius(all: 4)
                            ..ripple(true, splashColor: Colors.blueAccent),
                        )
                      : Txt(
                          " tidak ada file yang dipilih",
                          style: TxtStyle()
                            ..fontSize(24.sp)
                            ..textColor(Colors.white),
                        )),
            ),
          ],
        )
      ],
    );
  }
}
