import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String nik;
  @HiveField(2)
  String nama;
  @HiveField(3)
  String tempat;
  @HiveField(4)
  DateTime tanggal;
  @HiveField(5)
  String jenis;
  @HiveField(6)
  String desa;
  @HiveField(7)
  String rt;
  @HiveField(8)
  String rw;
  @HiveField(9)
  String kecamatan;
  @HiveField(10)
  String kabupaten;
  @HiveField(11)
  String provinsi;
  @HiveField(12)
  // ignore: non_constant_identifier_names
  String no_telp;
  @HiveField(13)
  String password;
  @HiveField(14)
  String token;

  UserModel(
      {this.id = 0,
      this.nik,
      this.nama,
      this.tempat,
      this.tanggal,
      this.jenis,
      this.desa,
      this.rt,
      this.rw,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      // ignore: non_constant_identifier_names
      this.no_telp,
      this.password = '',
      this.token});

  factory UserModel.createFromJson(Map<String, dynamic> json) {
    return UserModel(
        id: int.parse(json['user_id']),
        nik: json['user_nik'],
        nama: json['user_nama'],
        tempat: json['user_tempat_lahir'],
        tanggal: DateTimeUtils.toDate(json['user_tanggal_lahir']),
        jenis: json['user_jk'],
        desa: json['desa'],
        rt: json['rt'],
        rw: json['rw'],
        kecamatan: json['kecamatan'],
        kabupaten: json['kabupaten'],
        no_telp: json['user_telepon'],
        provinsi: json['provinsi'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_nik'] = this.nik;
    data['user_nama'] = this.nama;
    data['user_tempat_lahir'] = this.tempat;
    data['user_tanggal_lahir'] = DateTimeUtils.convert(this.tanggal);
    data['user_jk'] = this.jenis;
    data['desa'] = this.desa;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten'] = this.kabupaten;
    data['provinsi'] = this.provinsi;
    data['user_telepon'] = this.no_telp;
    data['user_password'] = this.password;
    return data;
  }
}
