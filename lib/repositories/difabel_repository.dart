import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gendisdesa/services/dio_service.dart';
import 'package:gendisdesa/utils/response_utils.dart';

abstract class DifabelRepository {
  static Future<Map<String, dynamic>> getDifabels(int limit, int offset) async {
    try {
      Dio dio = await DioService.withToken();
      Response response = await dio.get("/difabel?limit=$limit&offset=$offset");
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.toString());
    }
  }

  static Future<Map<String, dynamic>> getStaticData() async {
    try {
      Response response = await DioService.init().get("/static");
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }

  static Future<Map<String, dynamic>> insertDifabel(
      Map<String, dynamic> difabel) async {
    try {
      Dio dio = await DioService.withToken();
      Response response = await dio.post("/difabel", data: difabel,
          onSendProgress: (int send, int total) {
        print("data $send : $total");
      });
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      print("data $response");
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }

  static Future<Map<String, dynamic>> updateDifabel(
      Map<String, dynamic> difabel) async {
    try {
      Dio dio = await DioService.withToken();
      Response response = await dio.put("/difabel/${difabel['difabel_id']}",
          data: difabel, onSendProgress: (int send, int total) {
        print("data $send : $total");
      });
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }

  static Future<Map<String, dynamic>> deleteDifabel(int id) async {
    try {
      Dio dio = await DioService.withToken();
      Response response = await dio.delete(
        "/difabel/$id",
      );
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }

  static Future<Map<String, dynamic>> cekStatus(
    String nik,
  ) async {
    try {
      Response response =
          await DioService.init().post("/difabel/cekstatus", data: {
        "difabel_nik": nik,
      });
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } on DioError catch (e) {
      return ResponseUtils.errorServer(e.message.toString());
    } catch (e) {
      return ResponseUtils.errorServer(e.toString());
    }
  }
}
