import 'package:gendisdesa/utils/date_time_utils.dart';

class OrangTuaModel {
  // ignore: non_constant_identifier_names
  int orang_tua_id;
  // ignore: non_constant_identifier_names
  String difabel_no_urut;
  // ignore: non_constant_identifier_names
  String ayah_nama;
  // ignore: non_constant_identifier_names
  String ayah_nik;
  // ignore: non_constant_identifier_names
  String ayah_no_kk;
  // ignore: non_constant_identifier_names
  String ayah_tempat_lahir;
  // ignore: non_constant_identifier_names
  DateTime ayah_tanggal_lahir;
  // ignore: non_constant_identifier_names
  String ayah_jk;
  // ignore: non_constant_identifier_names
  int ayah_agama_id;
  // ignore: non_constant_identifier_names
  String ayah_alamat_jalan_perumahan;
  // ignore: non_constant_identifier_names
  String ayah_alamat_rt;
  // ignore: non_constant_identifier_names
  String ayah_alamat_rw;
  // ignore: non_constant_identifier_names
  String ayah_alamat_desa;
  // ignore: non_constant_identifier_names
  String ayah_alamat_kecamatan;
  // ignore: non_constant_identifier_names
  String ayah_alamat_kabupaten;
  // ignore: non_constant_identifier_names
  String ayah_alamat_telepon;
  // ignore: non_constant_identifier_names
  String ibu_nama;
  // ignore: non_constant_identifier_names
  String ibu_nik;
  // ignore: non_constant_identifier_names
  String ibu_no_kk;
  // ignore: non_constant_identifier_names
  String ibu_tempat_lahir;
  // ignore: non_constant_identifier_names
  DateTime ibu_tanggal_lahir;
  // ignore: non_constant_identifier_names
  String ibu_jk;
  // ignore: non_constant_identifier_names
  int ibu_agama_id;
  // ignore: non_constant_identifier_names
  String ibu_alamat_jalan_perumahan;
  // ignore: non_constant_identifier_names
  String ibu_alamat_rt;
  // ignore: non_constant_identifier_names
  String ibu_alamat_rw;
  // ignore: non_constant_identifier_names
  String ibu_alamat_desa;
  // ignore: non_constant_identifier_names
  String ibu_alamat_kecamatan;
  // ignore: non_constant_identifier_names
  String ibu_alamat_kabupaten;
  // ignore: non_constant_identifier_names
  String ibu_alamat_telepon;

  // ignore: non_constant_identifier_names
  OrangTuaModel(
      // ignore: non_constant_identifier_names
      {this.orang_tua_id = 0,
      // ignore: non_constant_identifier_names
      this.difabel_no_urut,
      // ignore: non_constant_identifier_names
      this.ayah_nama,
      // ignore: non_constant_identifier_names
      this.ayah_nik,
      // ignore: non_constant_identifier_names
      this.ayah_no_kk,
      // ignore: non_constant_identifier_names
      this.ayah_tempat_lahir,
      // ignore: non_constant_identifier_names
      this.ayah_tanggal_lahir,
      // ignore: non_constant_identifier_names
      this.ayah_jk,
      // ignore: non_constant_identifier_names
      this.ayah_agama_id,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_jalan_perumahan,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_rt,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_rw,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_desa,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_kecamatan,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_kabupaten,
      // ignore: non_constant_identifier_names
      this.ayah_alamat_telepon,
      // ignore: non_constant_identifier_names
      this.ibu_nama,
      // ignore: non_constant_identifier_names
      this.ibu_nik,
      // ignore: non_constant_identifier_names
      this.ibu_no_kk,
      // ignore: non_constant_identifier_names
      this.ibu_tempat_lahir,
      // ignore: non_constant_identifier_names
      this.ibu_tanggal_lahir,
      // ignore: non_constant_identifier_names
      this.ibu_jk,
      // ignore: non_constant_identifier_names
      this.ibu_agama_id,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_jalan_perumahan,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_rt,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_rw,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_desa,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_kecamatan,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_kabupaten,
      // ignore: non_constant_identifier_names
      this.ibu_alamat_telepon});

  factory OrangTuaModel.createFromJson(Map<String, dynamic> json) {
    return OrangTuaModel(
        orang_tua_id: int.parse(json['orang_tua_id']),
        difabel_no_urut: json['difabel_no_urut'],
        ayah_nama: json['ayah_nama'],
        ayah_nik: json['ayah_nik'],
        ayah_no_kk: json['ayah_no_kk'],
        ayah_tempat_lahir: json['ayah_tempat_lahir'],
        ayah_tanggal_lahir:
            DateTimeUtils.toDate(json['ayah_tanggal_lahir'] ?? '1000-01-01'),
        ayah_jk: json['ayah_jk'],
        ayah_agama_id: int.parse(json['ayah_agama_id']),
        ayah_alamat_jalan_perumahan: json['ayah_alamat_jalan_perumahan'],
        ayah_alamat_rt: json['ayah_alamat_rt'],
        ayah_alamat_rw: json['ayah_alamat_rw'],
        ayah_alamat_desa: json['ayah_alamat_desa'],
        ayah_alamat_kecamatan: json['ayah_alamat_kecamatan'],
        ayah_alamat_kabupaten: json['ayah_alamat_kabupaten'],
        ayah_alamat_telepon: json['ayah_alamat_telepon'],
        ibu_nama: json['ibu_nama'],
        ibu_nik: json['ibu_nik'],
        ibu_no_kk: json['ibu_no_kk'],
        ibu_tempat_lahir: json['ibu_tempat_lahir'],
        ibu_tanggal_lahir:
            DateTimeUtils.toDate(json['ibu_tanggal_lahir'] ?? '1000-01-01'),
        ibu_jk: json['ibu_jk'],
        ibu_agama_id: int.parse(json['ibu_agama_id']),
        ibu_alamat_jalan_perumahan: json['ibu_alamat_jalan_perumahan'],
        ibu_alamat_rt: json['ibu_alamat_rt'],
        ibu_alamat_rw: json['ibu_alamat_rw'],
        ibu_alamat_desa: json['ibu_alamat_desa'],
        ibu_alamat_kecamatan: json['ibu_alamat_kecamatan'],
        ibu_alamat_kabupaten: json['ibu_alamat_kabupaten'],
        ibu_alamat_telepon: json['ibu_alamat_telepon']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['difabel_no_urut'] = this.difabel_no_urut;
    data['ayah_nama'] = this.ayah_nama;
    data['ayah_nik'] = this.ayah_nik;
    data['ayah_no_kk'] = this.ayah_no_kk;
    data['ayah_tempat_lahir'] = this.ayah_tempat_lahir;
    data['ayah_tanggal_lahir'] =
        this.ayah_tanggal_lahir.toString() ?? '1000-01-01';
    data['ayah_jk'] = this.ayah_jk;
    data['ayah_agama_id'] = this.ayah_agama_id;
    data['ayah_alamat_jalan_perumahan'] = this.ayah_alamat_jalan_perumahan;
    data['ayah_alamat_rt'] = this.ayah_alamat_rt;
    data['ayah_alamat_rw'] = this.ayah_alamat_rw;
    data['ayah_alamat_desa'] = this.ayah_alamat_desa;
    data['ayah_alamat_kecamatan'] = this.ayah_alamat_kecamatan;
    data['ayah_alamat_kabupaten'] = this.ayah_alamat_kabupaten;
    data['ayah_alamat_telepon'] = this.ayah_alamat_telepon;
    data['ibu_nama'] = this.ibu_nama;
    data['ibu_nik'] = this.ibu_nik;
    data['ibu_no_kk'] = this.ibu_no_kk;
    data['ibu_tempat_lahir'] = this.ibu_tempat_lahir;
    data['ibu_tanggal_lahir'] =
        this.ibu_tanggal_lahir.toString() ?? '1000-01-01';
    data['ibu_jk'] = this.ibu_jk;
    data['ibu_agama_id'] = this.ibu_agama_id;
    data['ibu_alamat_jalan_perumahan'] = this.ibu_alamat_jalan_perumahan;
    data['ibu_alamat_rt'] = this.ibu_alamat_rt;
    data['ibu_alamat_rw'] = this.ibu_alamat_rw;
    data['ibu_alamat_desa'] = this.ibu_alamat_desa;
    data['ibu_alamat_kecamatan'] = this.ibu_alamat_kecamatan;
    data['ibu_alamat_kabupaten'] = this.ibu_alamat_kabupaten;
    data['ibu_alamat_telepon'] = this.ibu_alamat_telepon;
    return data;
  }
}
