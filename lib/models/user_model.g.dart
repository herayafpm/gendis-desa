// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int,
      nik: fields[1] as String,
      nama: fields[2] as String,
      tempat: fields[3] as String,
      tanggal: fields[4] as DateTime,
      jenis: fields[5] as String,
      desa: fields[6] as String,
      rt: fields[7] as String,
      rw: fields[8] as String,
      kecamatan: fields[9] as String,
      kabupaten: fields[10] as String,
      provinsi: fields[11] as String,
      no_telp: fields[12] as String,
      password: fields[13] as String,
      token: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nik)
      ..writeByte(2)
      ..write(obj.nama)
      ..writeByte(3)
      ..write(obj.tempat)
      ..writeByte(4)
      ..write(obj.tanggal)
      ..writeByte(5)
      ..write(obj.jenis)
      ..writeByte(6)
      ..write(obj.desa)
      ..writeByte(7)
      ..write(obj.rt)
      ..writeByte(8)
      ..write(obj.rw)
      ..writeByte(9)
      ..write(obj.kecamatan)
      ..writeByte(10)
      ..write(obj.kabupaten)
      ..writeByte(11)
      ..write(obj.provinsi)
      ..writeByte(12)
      ..write(obj.no_telp)
      ..writeByte(13)
      ..write(obj.password)
      ..writeByte(14)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
