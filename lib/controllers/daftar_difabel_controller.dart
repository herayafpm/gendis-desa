import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gendisdesa/bloc/difabel/difabel_bloc.dart';
import 'package:gendisdesa/models/difabel_model.dart';
import 'package:gendisdesa/models/orang_tua_model.dart';
import 'package:gendisdesa/static_data.dart';
import 'package:gendisdesa/utils/compress_utils.dart';
import 'package:gendisdesa/utils/date_time_utils.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DaftarDifabelController extends GetxController {
  final difabel = DifabelModel().obs;
  final orangtua = OrangTuaModel().obs;
  final isLoading = false.obs;
  final listJenisDisabilitas = [].obs;
  final selectedJenisDisabilitas = "".obs;
  final listAlatBantu = [].obs;
  final selectedAlatBantu = "".obs;
  final listFasilitasKesehatan = [].obs;
  final selectedFasilitasKesehatan = "".obs;
  final listKeterampilan = [].obs;
  final selectedKeterampilan = "".obs;
  final listOrganisasi = [].obs;
  final selectedOrganisasi = "".obs;
  final listPekerjaan = [].obs;
  final selectedPekerjaan = "".obs;
  final listKebutuhanPelatihan = [].obs;
  final selectedKebutuhanPelatihan = "".obs;
  final listKebutuhanPerawatan = [].obs;
  final selectedKebutuhanPerawatan = "".obs;
  final listKondisiDifabel = [].obs;
  final selectedKondisiDifabel = "".obs;
  final listAgama = [].obs;
  final selectedAgamaDifabel = "".obs;
  final selectedAgamaAyah = "".obs;
  final selectedAgamaIbu = "".obs;
  final listKondisiOrangTua = [].obs;
  final selectedKondisiOrangTua = "".obs;
  TextEditingController nikDifabelController = TextEditingController();
  TextEditingController nokkDifabelController = TextEditingController();
  TextEditingController namaDifabelController = TextEditingController();
  TextEditingController tempatlahirDifabelController = TextEditingController();
  TextEditingController alamatDifabelController = TextEditingController();
  TextEditingController rtDifabelController = TextEditingController();
  TextEditingController rwDifabelController = TextEditingController();
  TextEditingController desaDifabelController = TextEditingController();
  TextEditingController kecamatanDifabelController = TextEditingController();
  TextEditingController kabupatenDifabelController = TextEditingController();
  TextEditingController notelpDifabelController = TextEditingController();
  TextEditingController nodtksDifabelController = TextEditingController();
  TextEditingController keterampilanlainnyaDifabelController =
      TextEditingController();
  TextEditingController organisasilainnyaDifabelController =
      TextEditingController();
  TextEditingController pekerjaanlainnyaDifabelController =
      TextEditingController();
  TextEditingController kebutuhanpelatihanlainnyaDifabelController =
      TextEditingController();
  TextEditingController kebutuhanperawatanlainnyaDifabelController =
      TextEditingController();
  TextEditingController permasalahanDifabelController = TextEditingController();
  // Ayah
  TextEditingController nikAyahDifabelController = TextEditingController();
  TextEditingController nokkAyahDifabelController = TextEditingController();
  TextEditingController namaAyahDifabelController = TextEditingController();
  TextEditingController tempatlahirAyahDifabelController =
      TextEditingController();
  TextEditingController alamatAyahDifabelController = TextEditingController();
  TextEditingController rtAyahDifabelController = TextEditingController();
  TextEditingController rwAyahDifabelController = TextEditingController();
  TextEditingController desaAyahDifabelController = TextEditingController();
  TextEditingController kecamatanAyahDifabelController =
      TextEditingController();
  TextEditingController kabupatenAyahDifabelController =
      TextEditingController();
  TextEditingController notelpAyahDifabelController = TextEditingController();

  // Ibu
  TextEditingController nikIbuDifabelController = TextEditingController();
  TextEditingController nokkIbuDifabelController = TextEditingController();
  TextEditingController namaIbuDifabelController = TextEditingController();
  TextEditingController tempatlahirIbuDifabelController =
      TextEditingController();
  TextEditingController alamatIbuDifabelController = TextEditingController();
  TextEditingController rtIbuDifabelController = TextEditingController();
  TextEditingController rwIbuDifabelController = TextEditingController();
  TextEditingController desaIbuDifabelController = TextEditingController();
  TextEditingController kecamatanIbuDifabelController = TextEditingController();
  TextEditingController kabupatenIbuDifabelController = TextEditingController();
  TextEditingController notelpIbuDifabelController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    clearSuccess();
    difabel.value.difabel_tanggal_lahir = DateTimeUtils.toDate("1000-01-01");
    orangtua.value.ayah_tanggal_lahir = DateTimeUtils.toDate("1000-01-01");
    orangtua.value.ibu_tanggal_lahir = DateTimeUtils.toDate("1000-01-01");
    super.onInit();
  }

  String loopingData(List datas, int pembanding, String id, String nama) {
    String getter = "";
    for (var data in datas) {
      if (int.parse(data[id]) == pembanding) {
        getter = data[nama];
      }
    }
    return getter;
  }

  void fillField() {
    // difabel
    nikDifabelController.text = difabel.value.difabel_nik;
    nokkDifabelController.text = difabel.value.difabel_no_kk;
    namaDifabelController.text = difabel.value.difabel_nama;
    tempatlahirDifabelController.text = difabel.value.difabel_tempat_lahir;
    alamatDifabelController.text = difabel.value.alamat_jalan_perumahan;
    rtDifabelController.text = difabel.value.alamat_rt;
    rwDifabelController.text = difabel.value.alamat_rw;
    desaDifabelController.text = difabel.value.alamat_desa;
    kecamatanDifabelController.text = difabel.value.alamat_kecamatan;
    kabupatenDifabelController.text = difabel.value.alamat_kabupaten;
    notelpDifabelController.text = difabel.value.alamat_telepon;
    nodtksDifabelController.text = difabel.value.difabel_no_dtks;
    permasalahanDifabelController.text = difabel.value.difabel_permasalahan;
    selectedAgamaDifabel.value = loopingData(
        listAgama, difabel.value.agama_id, 'agama_id', 'agama_nama');
    selectedJenisDisabilitas.value = loopingData(
        listJenisDisabilitas,
        difabel.value.jenis_disabilitas_id,
        'jenis_disabilitas_id',
        'jenis_disabilitas_nama');
    selectedAlatBantu.value = loopingData(listAlatBantu,
        difabel.value.alat_bantu_id, 'alat_bantu_id', 'alat_bantu_nama');
    selectedFasilitasKesehatan.value = loopingData(
        listFasilitasKesehatan,
        difabel.value.fasilitas_kesehatan_id,
        'fasilitas_kesehatan_id',
        'fasilitas_kesehatan_nama');
    selectedKeterampilan.value = loopingData(listKeterampilan,
        difabel.value.keterampilan_id, 'keterampilan_id', 'keterampilan_nama');
    selectedOrganisasi.value = loopingData(listOrganisasi,
        difabel.value.organisasi_id, 'organisasi_id', 'organisasi_nama');
    selectedPekerjaan.value = loopingData(listPekerjaan,
        difabel.value.pekerjaan_id, 'pekerjaan_id', 'pekerjaan_nama');
    selectedKebutuhanPelatihan.value = loopingData(
        listKebutuhanPelatihan,
        difabel.value.kebutuhan_pelatihan_id,
        'kebutuhan_pelatihan_id',
        'kebutuhan_pelatihan_nama');
    selectedKebutuhanPerawatan.value = loopingData(
        listKebutuhanPerawatan,
        difabel.value.kebutuhan_perawatan_id,
        'kebutuhan_perawatan_id',
        'kebutuhan_perawatan_nama');
    selectedKondisiDifabel.value = loopingData(
        listKondisiDifabel,
        difabel.value.kondisi_difabel_id,
        'kondisi_difabel_id',
        'kondisi_difabel_nama');
    selectedKondisiOrangTua.value = loopingData(
        listKondisiOrangTua,
        difabel.value.kondisi_orang_tua_id,
        'kondisi_orang_tua_id',
        'kondisi_orang_tua_nama');

    keterampilanlainnyaDifabelController.text =
        difabel.value.difabel_keterampilan_lainnya;
    organisasilainnyaDifabelController.text =
        difabel.value.difabel_organisasi_lainnya;
    pekerjaanlainnyaDifabelController.text =
        difabel.value.difabel_pekerjaan_lainnya;
    kebutuhanpelatihanlainnyaDifabelController.text =
        difabel.value.difabel_pelatihan_lainnya;
    kebutuhanperawatanlainnyaDifabelController.text =
        difabel.value.difabel_perawatan_lainnya;
    // Ayah
    nikAyahDifabelController.text = orangtua.value.ayah_nik;
    nokkAyahDifabelController.text = orangtua.value.ayah_no_kk;
    namaAyahDifabelController.text = orangtua.value.ayah_nama;
    tempatlahirAyahDifabelController.text = orangtua.value.ayah_tempat_lahir;
    alamatAyahDifabelController.text =
        orangtua.value.ayah_alamat_jalan_perumahan;
    rtAyahDifabelController.text = orangtua.value.ayah_alamat_rt;
    rwAyahDifabelController.text = orangtua.value.ayah_alamat_rw;
    desaAyahDifabelController.text = orangtua.value.ayah_alamat_desa;
    kecamatanAyahDifabelController.text = orangtua.value.ayah_alamat_kecamatan;
    kabupatenAyahDifabelController.text = orangtua.value.ayah_alamat_kabupaten;
    notelpAyahDifabelController.text = orangtua.value.ibu_alamat_telepon;
    selectedAgamaAyah.value = loopingData(
        listAgama, orangtua.value.ayah_agama_id, 'agama_id', 'agama_nama');
    // Ibu
    nikIbuDifabelController.text = orangtua.value.ibu_nik;
    nokkIbuDifabelController.text = orangtua.value.ibu_no_kk;
    namaIbuDifabelController.text = orangtua.value.ibu_nama;
    tempatlahirIbuDifabelController.text = orangtua.value.ibu_tempat_lahir;
    alamatIbuDifabelController.text = orangtua.value.ibu_alamat_jalan_perumahan;
    rtIbuDifabelController.text = orangtua.value.ibu_alamat_rt;
    rwIbuDifabelController.text = orangtua.value.ibu_alamat_rw;
    desaIbuDifabelController.text = orangtua.value.ibu_alamat_desa;
    kecamatanIbuDifabelController.text = orangtua.value.ibu_alamat_kecamatan;
    kabupatenIbuDifabelController.text = orangtua.value.ibu_alamat_kabupaten;
    notelpIbuDifabelController.text = orangtua.value.ibu_alamat_telepon;
    selectedAgamaIbu.value = loopingData(
        listAgama, orangtua.value.ibu_agama_id, 'agama_id', 'agama_nama');
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Pilih Foto Difabel",
          allViewTitle: "Semua Foto",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    print("data $error");
    if (resultList.length != 0) {
      ByteData image = await resultList[0].getByteData();
      Uint8List imageUint8List =
          image.buffer.asUint8List(image.offsetInBytes, image.lengthInBytes);
      Uint8List imageCompress = await CompressUtils.image(list: imageUint8List);
      List<int> imageListInt = imageCompress.cast<int>();
      String imageFile = base64Encode(imageListInt);
      difabel.update((val) {
        val.difabel_image = imageFile;
      });
    }
  }

  void showImage() {
    Widget image;
    if (difabel.value.difabel_image.contains("img_") ||
        difabel.value.difabel_image == 'kosong.png') {
      image = Image.network(
          "${StaticData.baseUrl}/uploads/${difabel.value.difabel_image}",
          fit: BoxFit.fill);
    } else {
      List<int> imageListInt = base64Decode(difabel.value.difabel_image);
      image = Image.memory(
        imageListInt,
        fit: BoxFit.fill,
      );
    }
    showDialog(
        context: Get.context,
        child: AlertDialog(
          title: Txt("Difabel Image"),
          content: image,
        ));
  }

  void proses(DifabelBloc bloc) async {
    isLoading.value = !isLoading.value;
    orangtua.update((val) {
      // ayah
      val.ayah_nik = nikAyahDifabelController.text;
      val.ayah_no_kk = nokkAyahDifabelController.text;
      val.ayah_nama = namaAyahDifabelController.text;
      val.ayah_tempat_lahir = tempatlahirAyahDifabelController.text;
      val.ayah_alamat_jalan_perumahan = alamatAyahDifabelController.text;
      val.ayah_alamat_rt = rtAyahDifabelController.text;
      val.ayah_alamat_rw = rwAyahDifabelController.text;
      val.ayah_alamat_desa = desaAyahDifabelController.text;
      val.ayah_alamat_kecamatan = kecamatanAyahDifabelController.text;
      val.ayah_alamat_kabupaten = kabupatenAyahDifabelController.text;
      val.ayah_alamat_telepon = notelpAyahDifabelController.text;
      // Ibu
      val.ibu_nik = nikIbuDifabelController.text;
      val.ibu_no_kk = nokkIbuDifabelController.text;
      val.ibu_nama = namaIbuDifabelController.text;
      val.ibu_tempat_lahir = tempatlahirIbuDifabelController.text;
      val.ibu_alamat_jalan_perumahan = alamatIbuDifabelController.text;
      val.ibu_alamat_rt = rtIbuDifabelController.text;
      val.ibu_alamat_rw = rwIbuDifabelController.text;
      val.ibu_alamat_desa = desaIbuDifabelController.text;
      val.ibu_alamat_kecamatan = kecamatanIbuDifabelController.text;
      val.ibu_alamat_kabupaten = kabupatenIbuDifabelController.text;
      val.ibu_alamat_telepon = notelpIbuDifabelController.text;
    });
    difabel.value.orang_tua = orangtua.value;
    difabel.update((val) {
      val.difabel_nik = nikDifabelController.text;
      val.difabel_no_kk = nokkDifabelController.text;
      val.difabel_nama = namaDifabelController.text;
      val.difabel_tempat_lahir = tempatlahirDifabelController.text;
      val.alamat_jalan_perumahan = alamatDifabelController.text;
      val.alamat_rt = rtDifabelController.text;
      val.alamat_rw = rwDifabelController.text;
      val.alamat_desa = desaDifabelController.text;
      val.alamat_kecamatan = kecamatanDifabelController.text;
      val.alamat_kabupaten = kabupatenDifabelController.text;
      val.alamat_telepon = notelpDifabelController.text;
      val.difabel_no_dtks = nodtksDifabelController.text;
      val.difabel_permasalahan = permasalahanDifabelController.text;
      if (val.keterampilan_id != 0) {
        keterampilanlainnyaDifabelController.clear();
      }
      val.difabel_keterampilan_lainnya =
          keterampilanlainnyaDifabelController.text;
      if (val.organisasi_id != 0) {
        organisasilainnyaDifabelController.clear();
      }
      val.difabel_organisasi_lainnya = organisasilainnyaDifabelController.text;
      if (val.pekerjaan_id != 0) {
        pekerjaanlainnyaDifabelController.clear();
      }
      val.difabel_pekerjaan_lainnya = pekerjaanlainnyaDifabelController.text;
      if (val.kebutuhan_pelatihan_id != 0) {
        kebutuhanpelatihanlainnyaDifabelController.clear();
      }
      val.difabel_pelatihan_lainnya =
          kebutuhanpelatihanlainnyaDifabelController.text;
      if (val.kebutuhan_perawatan_id != 0) {
        kebutuhanperawatanlainnyaDifabelController.clear();
      }
      val.difabel_perawatan_lainnya =
          kebutuhanperawatanlainnyaDifabelController.text;
    });
    bloc.add(DifabelFormBlocEvent(difabel.value));
  }

  void clearSuccess() {
    // difabel
    nikDifabelController.clear();
    nokkDifabelController.clear();
    namaDifabelController.clear();
    tempatlahirDifabelController.clear();
    alamatDifabelController.clear();
    rtDifabelController.clear();
    rwDifabelController.clear();
    desaDifabelController.clear();
    kecamatanDifabelController.clear();
    kabupatenDifabelController.clear();
    notelpDifabelController.clear();
    nodtksDifabelController.clear();
    permasalahanDifabelController.clear();
    keterampilanlainnyaDifabelController.clear();
    organisasilainnyaDifabelController.clear();
    pekerjaanlainnyaDifabelController.clear();
    kebutuhanpelatihanlainnyaDifabelController.clear();
    kebutuhanperawatanlainnyaDifabelController.clear();
    // Ayah
    nikAyahDifabelController.clear();
    nokkAyahDifabelController.clear();
    namaAyahDifabelController.clear();
    tempatlahirAyahDifabelController.clear();
    alamatAyahDifabelController.clear();
    rtAyahDifabelController.clear();
    rwAyahDifabelController.clear();
    desaAyahDifabelController.clear();
    kecamatanAyahDifabelController.clear();
    kabupatenAyahDifabelController.clear();
    notelpAyahDifabelController.clear();
    // Ibu
    nikIbuDifabelController.clear();
    nokkIbuDifabelController.clear();
    namaIbuDifabelController.clear();
    tempatlahirIbuDifabelController.clear();
    alamatIbuDifabelController.clear();
    rtIbuDifabelController.clear();
    rwIbuDifabelController.clear();
    desaIbuDifabelController.clear();
    kecamatanIbuDifabelController.clear();
    kabupatenIbuDifabelController.clear();
    notelpIbuDifabelController.clear();
    difabel.value = DifabelModel();
    orangtua.value = OrangTuaModel();
  }

  void showJenisKelaminPicker() {
    int initialIndex = 0;
    if (difabel.value.difabel_jk != null) {
      int no = 0;
      for (var jenis in StaticData.jenisKelamin) {
        if (jenis == difabel.value.difabel_jk) {
          initialIndex = no;
        }
        no = no + 1;
      }
    }
    showModalBottomSheet(
        context: Get.context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: initialIndex),
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  difabel.update((val) {
                    val.difabel_jk = StaticData.jenisKelamin[index];
                  });
                },
                children: new List<Widget>.generate(
                    StaticData.jenisKelamin.length, (int index) {
                  return new Center(
                    child: new Text(StaticData.jenisKelamin[index]),
                  );
                })),
          );
        });
  }

  void showJenisDisabilitasPicker(DifabelBloc bloc) {
    if (listJenisDisabilitas.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.jenis_disabilitas_id != null) {
        int no = 0;
        for (var jenis in listJenisDisabilitas) {
          if (difabel.value.jenis_disabilitas_id ==
              int.parse(jenis['jenis_disabilitas_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedJenisDisabilitas.value =
                        listJenisDisabilitas[index]['jenis_disabilitas_nama'];
                    difabel.update((val) {
                      val.jenis_disabilitas_id = int.parse(
                          listJenisDisabilitas[index]['jenis_disabilitas_id']);
                    });
                  },
                  children: new List<Widget>.generate(
                      listJenisDisabilitas.length, (int index) {
                    return new Center(
                      child: new Text(listJenisDisabilitas[index]
                          ['jenis_disabilitas_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showAlatBantuPicker(DifabelBloc bloc) {
    if (listAlatBantu.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.alat_bantu_id != null) {
        int no = 0;
        for (var jenis in listAlatBantu) {
          if (difabel.value.alat_bantu_id ==
              int.parse(jenis['alat_bantu_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedAlatBantu.value =
                        listAlatBantu[index]['alat_bantu_nama'];
                    difabel.update((val) {
                      val.alat_bantu_id =
                          int.parse(listAlatBantu[index]['alat_bantu_id']);
                    });
                  },
                  children: new List<Widget>.generate(listAlatBantu.length,
                      (int index) {
                    return new Center(
                      child: new Text(listAlatBantu[index]['alat_bantu_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showFasilitasKesehatanPicker(DifabelBloc bloc) {
    if (listFasilitasKesehatan.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.fasilitas_kesehatan_id != null) {
        int no = 0;
        for (var jenis in listFasilitasKesehatan) {
          if (difabel.value.fasilitas_kesehatan_id ==
              int.parse(jenis['fasilitas_kesehatan_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedFasilitasKesehatan.value =
                        listFasilitasKesehatan[index]
                            ['fasilitas_kesehatan_nama'];
                    difabel.update((val) {
                      val.fasilitas_kesehatan_id = int.parse(
                          listFasilitasKesehatan[index]
                              ['fasilitas_kesehatan_id']);
                    });
                  },
                  children: new List<Widget>.generate(
                      listFasilitasKesehatan.length, (int index) {
                    return new Center(
                      child: new Text(listFasilitasKesehatan[index]
                          ['fasilitas_kesehatan_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showKeterampilanPicker(DifabelBloc bloc) {
    if (listKeterampilan.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.keterampilan_id != null) {
        int no = 0;
        for (var jenis in listKeterampilan) {
          if (difabel.value.keterampilan_id ==
              int.parse(jenis['keterampilan_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedKeterampilan.value =
                        listKeterampilan[index]['keterampilan_nama'];
                    difabel.update((val) {
                      val.keterampilan_id =
                          int.parse(listKeterampilan[index]['keterampilan_id']);
                    });
                  },
                  children: new List<Widget>.generate(listKeterampilan.length,
                      (int index) {
                    return new Center(
                      child: new Text(
                          listKeterampilan[index]['keterampilan_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showOrganisasiPicker(DifabelBloc bloc) {
    if (listOrganisasi.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.organisasi_id != null) {
        int no = 0;
        for (var jenis in listOrganisasi) {
          if (difabel.value.organisasi_id ==
              int.parse(jenis['organisasi_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedOrganisasi.value =
                        listOrganisasi[index]['organisasi_nama'];
                    difabel.update((val) {
                      val.organisasi_id =
                          int.parse(listOrganisasi[index]['organisasi_id']);
                    });
                  },
                  children: new List<Widget>.generate(listOrganisasi.length,
                      (int index) {
                    return new Center(
                      child: new Text(listOrganisasi[index]['organisasi_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showPekerjaanPicker(DifabelBloc bloc) {
    if (listPekerjaan.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.pekerjaan_id != null) {
        int no = 0;
        for (var jenis in listPekerjaan) {
          if (difabel.value.pekerjaan_id == int.parse(jenis['pekerjaan_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedPekerjaan.value =
                        listPekerjaan[index]['pekerjaan_nama'];
                    difabel.update((val) {
                      val.pekerjaan_id =
                          int.parse(listPekerjaan[index]['pekerjaan_id']);
                    });
                  },
                  children: new List<Widget>.generate(listPekerjaan.length,
                      (int index) {
                    return new Center(
                      child: new Text(listPekerjaan[index]['pekerjaan_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showKebutuhanPelatihanPicker(DifabelBloc bloc) {
    if (listKebutuhanPelatihan.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.kebutuhan_pelatihan_id != null) {
        int no = 0;
        for (var jenis in listKebutuhanPelatihan) {
          if (difabel.value.kebutuhan_pelatihan_id ==
              int.parse(jenis['kebutuhan_pelatihan_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedKebutuhanPelatihan.value =
                        listKebutuhanPelatihan[index]
                            ['kebutuhan_pelatihan_nama'];
                    difabel.update((val) {
                      val.kebutuhan_pelatihan_id = int.parse(
                          listKebutuhanPelatihan[index]
                              ['kebutuhan_pelatihan_id']);
                    });
                  },
                  children: new List<Widget>.generate(
                      listKebutuhanPelatihan.length, (int index) {
                    return new Center(
                      child: new Text(listKebutuhanPelatihan[index]
                          ['kebutuhan_pelatihan_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showKebutuhanPerawatanPicker(DifabelBloc bloc) {
    if (listKebutuhanPerawatan.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.kebutuhan_perawatan_id != null) {
        int no = 0;
        for (var jenis in listKebutuhanPerawatan) {
          if (difabel.value.kebutuhan_perawatan_id ==
              int.parse(jenis['kebutuhan_perawatan_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedKebutuhanPerawatan.value =
                        listKebutuhanPerawatan[index]
                            ['kebutuhan_perawatan_nama'];
                    difabel.update((val) {
                      val.kebutuhan_perawatan_id = int.parse(
                          listKebutuhanPerawatan[index]
                              ['kebutuhan_perawatan_id']);
                    });
                  },
                  children: new List<Widget>.generate(
                      listKebutuhanPerawatan.length, (int index) {
                    return new Center(
                      child: new Text(listKebutuhanPerawatan[index]
                          ['kebutuhan_perawatan_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showKondisiDifabelPicker(DifabelBloc bloc) {
    if (listKondisiDifabel.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.kondisi_difabel_id != null) {
        int no = 0;
        for (var jenis in listKondisiDifabel) {
          if (difabel.value.kondisi_difabel_id ==
              int.parse(jenis['kondisi_difabel_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedKondisiDifabel.value =
                        listKondisiDifabel[index]['kondisi_difabel_nama'];
                    difabel.update((val) {
                      val.kondisi_difabel_id = int.parse(
                          listKondisiDifabel[index]['kondisi_difabel_id']);
                    });
                  },
                  children: new List<Widget>.generate(listKondisiDifabel.length,
                      (int index) {
                    return new Center(
                      child: new Text(
                          listKondisiDifabel[index]['kondisi_difabel_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showAgamaDifabelPicker(DifabelBloc bloc) {
    if (listAgama.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.agama_id != null) {
        int no = 0;
        for (var jenis in listAgama) {
          if (difabel.value.agama_id == int.parse(jenis['agama_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedAgamaDifabel.value = listAgama[index]['agama_nama'];
                    difabel.update((val) {
                      val.agama_id = int.parse(listAgama[index]['agama_id']);
                    });
                  },
                  children:
                      new List<Widget>.generate(listAgama.length, (int index) {
                    return new Center(
                      child: new Text(listAgama[index]['agama_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showAgamaAyahPicker(DifabelBloc bloc) {
    if (listAgama.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (orangtua.value.ayah_agama_id != null) {
        int no = 0;
        for (var jenis in listAgama) {
          if (orangtua.value.ayah_agama_id == int.parse(jenis['agama_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedAgamaAyah.value = listAgama[index]['agama_nama'];
                    orangtua.update((val) {
                      val.ayah_agama_id =
                          int.parse(listAgama[index]['agama_id']);
                    });
                  },
                  children:
                      new List<Widget>.generate(listAgama.length, (int index) {
                    return new Center(
                      child: new Text(listAgama[index]['agama_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showAgamaIbuPicker(DifabelBloc bloc) {
    if (listAgama.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (orangtua.value.ibu_agama_id != null) {
        int no = 0;
        for (var jenis in listAgama) {
          if (orangtua.value.ibu_agama_id == int.parse(jenis['agama_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedAgamaIbu.value = listAgama[index]['agama_nama'];
                    orangtua.update((val) {
                      val.ibu_agama_id =
                          int.parse(listAgama[index]['agama_id']);
                    });
                  },
                  children:
                      new List<Widget>.generate(listAgama.length, (int index) {
                    return new Center(
                      child: new Text(listAgama[index]['agama_nama']),
                    );
                  })),
            );
          });
    }
  }

  void showKondisiOrangTuaPicker(DifabelBloc bloc) {
    if (listKondisiOrangTua.length == 0) {
      bloc..add(DifabelGetStaticBlocEvent());
    } else {
      int initialIndex = 0;
      if (difabel.value.kondisi_orang_tua_id != null) {
        int no = 0;
        for (var jenis in listKondisiOrangTua) {
          if (difabel.value.kondisi_orang_tua_id ==
              int.parse(jenis['kondisi_orang_tua_id'])) {
            initialIndex = no;
          }
          no = no + 1;
        }
      }
      showModalBottomSheet(
          context: Get.context,
          builder: (BuildContext context) {
            return Container(
              height: 200.0,
              child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: initialIndex),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    selectedKondisiOrangTua.value =
                        listKondisiOrangTua[index]['kondisi_orang_tua_nama'];
                    difabel.update((val) {
                      val.kondisi_orang_tua_id = int.parse(
                          listKondisiOrangTua[index]['kondisi_orang_tua_id']);
                    });
                  },
                  children: new List<Widget>.generate(
                      listKondisiOrangTua.length, (int index) {
                    return new Center(
                      child: new Text(
                          listKondisiOrangTua[index]['kondisi_orang_tua_nama']),
                    );
                  })),
            );
          });
    }
  }
}
