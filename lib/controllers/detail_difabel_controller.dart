import 'package:gendisdesa/models/difabel_model.dart';
import 'package:get/get.dart';

class DetailDifabelController extends GetxController {
  final difabel = DifabelModel().obs;
  final agama = "".obs;
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  final agama_ayah = "".obs;
  // ignore: non_constant_identifier_names
  final agama_ibu = "".obs;
  // ignore: non_constant_identifier_names
  final jenis_disabilitas = "".obs;
  // ignore: non_constant_identifier_names
  final alat_bantu = "".obs;
  // ignore: non_constant_identifier_names
  final fasilitas_kesehatan = "".obs;
  // ignore: non_constant_identifier_names
  final keterampilan = "".obs;
  // ignore: non_constant_identifier_names
  final kebutuhan_perawatan = "".obs;
  // ignore: non_constant_identifier_names
  final kebutuhan_pelatihan = "".obs;
  // ignore: non_constant_identifier_names
  final kondisi_difabel = "".obs;
  // ignore: non_constant_identifier_names
  final kondisi_orang_tua = "".obs;
  final organisasi = "".obs;
  final pekerjaan = "".obs;

  @override
  void onInit() {
    difabel.value = Get.arguments;
    super.onInit();
  }

  String getFromList(Map<String, dynamic> data, String pembanding, String table,
      String id, String nama) {
    var datas = data[table] as List;
    String hasil = "";
    datas.forEach((e) {
      if (pembanding == e[id]) {
        hasil = e[nama];
      }
    });
    return hasil;
  }

  void staticData(Map<String, dynamic> data) {
    agama.value = getFromList(data, difabel.value.agama_id.toString(), 'agama',
        'agama_id', 'agama_nama');
    agama_ayah.value = getFromList(
        data,
        difabel.value.orang_tua.ayah_agama_id.toString(),
        'agama',
        'agama_id',
        'agama_nama');
    agama_ibu.value = getFromList(
        data,
        difabel.value.orang_tua.ibu_agama_id.toString(),
        'agama',
        'agama_id',
        'agama_nama');
    jenis_disabilitas.value = getFromList(
        data,
        difabel.value.jenis_disabilitas_id.toString(),
        'jenis_disabilitas',
        'jenis_disabilitas_id',
        'jenis_disabilitas_nama');
    alat_bantu.value = getFromList(data, difabel.value.alat_bantu_id.toString(),
        'alat_bantu', 'alat_bantu_id', 'alat_bantu_nama');
    fasilitas_kesehatan.value = getFromList(
        data,
        difabel.value.fasilitas_kesehatan_id.toString(),
        'fasilitas_kesehatan',
        'fasilitas_kesehatan_id',
        'fasilitas_kesehatan_nama');
    keterampilan.value = getFromList(
        data,
        difabel.value.keterampilan_id.toString(),
        'keterampilan',
        'keterampilan_id',
        'keterampilan_nama');
    organisasi.value = getFromList(data, difabel.value.organisasi_id.toString(),
        'organisasi', 'organisasi_id', 'organisasi_nama');
    pekerjaan.value = getFromList(data, difabel.value.pekerjaan_id.toString(),
        'pekerjaan', 'pekerjaan_id', 'pekerjaan_nama');
    kebutuhan_pelatihan.value = getFromList(
        data,
        difabel.value.kebutuhan_pelatihan_id.toString(),
        'kebutuhan_pelatihan',
        'kebutuhan_pelatihan_id',
        'kebutuhan_pelatihan_nama');
    kebutuhan_perawatan.value = getFromList(
        data,
        difabel.value.kebutuhan_perawatan_id.toString(),
        'kebutuhan_perawatan',
        'kebutuhan_perawatan_id',
        'kebutuhan_perawatan_nama');
    kondisi_difabel.value = getFromList(
        data,
        difabel.value.kondisi_difabel_id.toString(),
        'kondisi_difabel',
        'kondisi_difabel_id',
        'kondisi_difabel_nama');
    kondisi_orang_tua.value = getFromList(
        data,
        difabel.value.kondisi_orang_tua_id.toString(),
        'kondisi_orang_tua',
        'kondisi_orang_tua_id',
        'kondisi_orang_tua_nama');
  }
}
