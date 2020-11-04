import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:gendisdesa/services/dio_service.dart';
import 'package:gendisdesa/utils/response_utils.dart';

abstract class HomeRepository {
  static Future<Map<String, dynamic>> getBanners() async {
    try {
      Response response = await DioService.banyumaskab().get("/api");
      Map<String, dynamic> json =
          jsonDecode(response.data) as Map<String, dynamic>;
      Map<String, dynamic> data = new Map<String, dynamic>();
      data['statusCode'] = (json['status'] == 1) ? 200 : 400;
      data['data'] = json['data'];
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }

  // ignore: missing_return
  static Future<Map<String, dynamic>> getInfoDifabel() async {
    try {
      Response responseVerifikasi =
          await DioService.banyumaskab().get("/difabelverifikasi");
      Response responseTerdaftar =
          await DioService.banyumaskab().get("/difabelterdaftar");
      if (responseVerifikasi.statusCode == 200 &&
          responseTerdaftar.statusCode == 200) {
        Map<String, dynamic> data = Map<String, dynamic>();
        data['statusCode'] = 200;
        data['data'] = {
          'verifikasi': jsonDecode(responseVerifikasi.data),
          'terdaftar': jsonDecode(responseTerdaftar.data)
        };
        return data;
      }
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }
}
