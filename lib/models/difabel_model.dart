import 'package:gendisdesa/models/orang_tua_model.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';

class DifabelModel {
  // ignore: non_constant_identifier_names
  int difabel_id;
  // ignore: non_constant_identifier_names
  String difabel_no_urut;
  // ignore: non_constant_identifier_names
  String difabel_nama;
  // ignore: non_constant_identifier_names
  String difabel_nik;
  // ignore: non_constant_identifier_names
  String difabel_no_kk;
  // ignore: non_constant_identifier_names
  String difabel_no_dtks;
  // ignore: non_constant_identifier_names
  String difabel_tempat_lahir;
  // ignore: non_constant_identifier_names
  DateTime difabel_tanggal_lahir;
  // ignore: non_constant_identifier_names
  String difabel_jk;
  // ignore: non_constant_identifier_names
  int agama_id;
  // ignore: non_constant_identifier_names
  String alamat_jalan_perumahan;
  // ignore: non_constant_identifier_names
  String alamat_rt;
  // ignore: non_constant_identifier_names
  String alamat_rw;
  // ignore: non_constant_identifier_names
  String alamat_desa;
  // ignore: non_constant_identifier_names
  String alamat_kecamatan;
  // ignore: non_constant_identifier_names
  String alamat_kabupaten;
  // ignore: non_constant_identifier_names
  String alamat_telepon;
  // ignore: non_constant_identifier_names
  int jenis_disabilitas_id;
  // ignore: non_constant_identifier_names
  int alat_bantu_id;
  // ignore: non_constant_identifier_names
  int fasilitas_kesehatan_id;
  // ignore: non_constant_identifier_names
  int keterampilan_id;
  // ignore: non_constant_identifier_names
  String difabel_keterampilan_lainnya;
  // ignore: non_constant_identifier_names
  int organisasi_id;
  // ignore: non_constant_identifier_names
  String difabel_organisasi_lainnya;
  // ignore: non_constant_identifier_names
  int kondisi_orang_tua_id;
  // ignore: non_constant_identifier_names
  int pekerjaan_id;
  // ignore: non_constant_identifier_names
  String difabel_pekerjaan_lainnya;
  // ignore: non_constant_identifier_names
  int kebutuhan_pelatihan_id;
  // ignore: non_constant_identifier_names
  String difabel_pelatihan_lainnya;
  // ignore: non_constant_identifier_names
  int kebutuhan_perawatan_id;
  // ignore: non_constant_identifier_names
  String difabel_perawatan_lainnya;
  // ignore: non_constant_identifier_names
  int kondisi_difabel_id;
  // ignore: non_constant_identifier_names
  String difabel_permasalahan;
  // ignore: non_constant_identifier_names
  int sudah_verif;
  // ignore: non_constant_identifier_names
  String difabel_image;
  // ignore: non_constant_identifier_names
  OrangTuaModel orang_tua;

  // ignore: non_constant_identifier_names
  DifabelModel(
      // ignore: non_constant_identifier_names
      {this.difabel_id,
      // ignore: non_constant_identifier_names
      this.difabel_no_urut,
      // ignore: non_constant_identifier_names
      this.difabel_nama,
      // ignore: non_constant_identifier_names
      this.difabel_nik,
      // ignore: non_constant_identifier_names
      this.difabel_no_kk,
      // ignore: non_constant_identifier_names
      this.difabel_no_dtks,
      // ignore: non_constant_identifier_names
      this.difabel_tempat_lahir,
      // ignore: non_constant_identifier_names
      this.difabel_tanggal_lahir,
      // ignore: non_constant_identifier_names
      this.difabel_jk,
      // ignore: non_constant_identifier_names
      this.agama_id,
      // ignore: non_constant_identifier_names
      this.alamat_jalan_perumahan,
      // ignore: non_constant_identifier_names
      this.alamat_rt,
      // ignore: non_constant_identifier_names
      this.alamat_rw,
      // ignore: non_constant_identifier_names
      this.alamat_desa,
      // ignore: non_constant_identifier_names
      this.alamat_kecamatan,
      // ignore: non_constant_identifier_names
      this.alamat_kabupaten,
      // ignore: non_constant_identifier_names
      this.alamat_telepon,
      // ignore: non_constant_identifier_names
      this.jenis_disabilitas_id,
      // ignore: non_constant_identifier_names
      this.alat_bantu_id,
      // ignore: non_constant_identifier_names
      this.fasilitas_kesehatan_id,
      // ignore: non_constant_identifier_names
      this.keterampilan_id,
      // ignore: non_constant_identifier_names
      this.difabel_keterampilan_lainnya,
      // ignore: non_constant_identifier_names
      this.organisasi_id,
      // ignore: non_constant_identifier_names
      this.difabel_organisasi_lainnya,
      // ignore: non_constant_identifier_names
      this.kondisi_orang_tua_id,
      // ignore: non_constant_identifier_names
      this.pekerjaan_id,
      // ignore: non_constant_identifier_names
      this.difabel_pekerjaan_lainnya,
      // ignore: non_constant_identifier_names
      this.kebutuhan_pelatihan_id,
      // ignore: non_constant_identifier_names
      this.difabel_pelatihan_lainnya,
      // ignore: non_constant_identifier_names
      this.kebutuhan_perawatan_id,
      // ignore: non_constant_identifier_names
      this.difabel_perawatan_lainnya,
      // ignore: non_constant_identifier_names
      this.kondisi_difabel_id,
      // ignore: non_constant_identifier_names
      this.difabel_permasalahan,
      // ignore: non_constant_identifier_names
      this.sudah_verif,
      // ignore: non_constant_identifier_names
      this.difabel_image,
      // ignore: non_constant_identifier_names
      this.orang_tua});

  factory DifabelModel.createFromJson(Map<String, dynamic> json) {
    return DifabelModel(
        difabel_id: int.parse(json['difabel_id']),
        difabel_no_urut: json['difabel_no_urut'],
        difabel_nama: json['difabel_nama'],
        difabel_nik: json['difabel_nik'],
        difabel_no_kk: json['difabel_no_kk'],
        difabel_no_dtks: json['difabel_no_dtks'],
        difabel_tempat_lahir: json['difabel_tempat_lahir'],
        difabel_tanggal_lahir:
            DateTimeUtils.toDate(json['difabel_tanggal_lahir'] ?? '1000-01-01'),
        difabel_jk: json['difabel_jk'],
        agama_id: int.parse(json['agama_id']),
        alamat_jalan_perumahan: json['alamat_jalan_perumahan'],
        alamat_rt: json['alamat_rt'],
        alamat_rw: json['alamat_rw'],
        alamat_desa: json['alamat_desa'],
        alamat_kecamatan: json['alamat_kecamatan'],
        alamat_kabupaten: json['alamat_kabupaten'],
        alamat_telepon: json['alamat_telepon'],
        jenis_disabilitas_id: int.parse(json['jenis_disabilitas_id']),
        alat_bantu_id: int.parse(json['alat_bantu_id']),
        fasilitas_kesehatan_id: int.parse(json['fasilitas_kesehatan_id']),
        keterampilan_id: int.parse(json['keterampilan_id']),
        difabel_keterampilan_lainnya: json['difabel_keterampilan_lainnya'],
        organisasi_id: int.parse(json['organisasi_id']),
        difabel_organisasi_lainnya: json['difabel_organisasi_lainnya'],
        kondisi_orang_tua_id: int.parse(json['kondisi_orang_tua_id']),
        pekerjaan_id: int.parse(json['pekerjaan_id']),
        difabel_pekerjaan_lainnya: json['difabel_pekerjaan_lainnya'],
        kebutuhan_pelatihan_id: int.parse(json['kebutuhan_pelatihan_id']),
        difabel_pelatihan_lainnya: json['difabel_pelatihan_lainnya'],
        kebutuhan_perawatan_id: int.parse(json['kebutuhan_perawatan_id']),
        difabel_perawatan_lainnya: json['difabel_perawatan_lainnya'],
        kondisi_difabel_id: int.parse(json['kondisi_difabel_id']),
        difabel_permasalahan: json['difabel_permasalahan'],
        sudah_verif: int.parse(json['sudah_verif']),
        difabel_image: json['difabel_image'],
        orang_tua: OrangTuaModel.createFromJson(json['orang_tua']));
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['difabel_id'] = this.difabel_id;
    data['difabel_nama'] = this.difabel_nama;
    data['difabel_nik'] = this.difabel_nik;
    data['difabel_no_kk'] = this.difabel_no_kk;
    data['difabel_no_dtks'] = this.difabel_no_dtks;
    data['difabel_tempat_lahir'] = this.difabel_tempat_lahir;
    data['difabel_tanggal_lahir'] =
        this.difabel_tanggal_lahir.toString() ?? '1000-01-01';
    data['difabel_jk'] = this.difabel_jk;
    data['agama_id'] = this.agama_id;
    data['alamat_jalan_perumahan'] = this.alamat_jalan_perumahan;
    data['alamat_rt'] = this.alamat_rt;
    data['alamat_rw'] = this.alamat_rw;
    data['alamat_desa'] = this.alamat_desa;
    data['alamat_kecamatan'] = this.alamat_kecamatan;
    data['alamat_kabupaten'] = this.alamat_kabupaten;
    data['alamat_telepon'] = this.alamat_telepon;
    data['jenis_disabilitas_id'] = this.jenis_disabilitas_id;
    data['alat_bantu_id'] = this.alat_bantu_id;
    data['fasilitas_kesehatan_id'] = this.fasilitas_kesehatan_id;
    data['keterampilan_id'] = this.keterampilan_id;
    data['difabel_keterampilan_lainnya'] = this.difabel_keterampilan_lainnya;
    data['organisasi_id'] = this.organisasi_id;
    data['difabel_organisasi_lainnya'] = this.difabel_organisasi_lainnya;
    data['kondisi_orang_tua_id'] = this.kondisi_orang_tua_id;
    data['pekerjaan_id'] = this.pekerjaan_id;
    data['difabel_pekerjaan_lainnya'] = this.difabel_pekerjaan_lainnya;
    data['kebutuhan_pelatihan_id'] = this.kebutuhan_pelatihan_id;
    data['difabel_pelatihan_lainnya'] = this.difabel_pelatihan_lainnya;
    data['kebutuhan_perawatan_id'] = this.kebutuhan_perawatan_id;
    data['difabel_perawatan_lainnya'] = this.difabel_perawatan_lainnya;
    data['kondisi_difabel_id'] = this.kondisi_difabel_id;
    data['difabel_permasalahan'] = this.difabel_permasalahan;
    data['difabel_image'] = this.difabel_image;
    data['orang_tua'] = this.orang_tua.toJson();
    return data;
  }
}
