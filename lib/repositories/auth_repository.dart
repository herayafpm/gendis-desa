import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gendisdesa/models/user_model.dart';
import 'package:gendisdesa/services/dio_service.dart';
import 'package:gendisdesa/utils/response_utils.dart';

abstract class AuthRepository {
  static Future<Map<String, dynamic>> login(String nik, String password) async {
    try {
      Response response = await DioService.init().post("/auth", data: {
        "user_nik": nik,
        "user_password": password,
      });
      Map<String, dynamic> data = Map<String, dynamic>();
      data['statusCode'] = response.statusCode;
      data['data'] = response.data;
      return data;
    } on SocketException catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.message);
    } on DioError catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.message);
    } catch (e) {
      print(e);
      return ResponseUtils.errorServer(e.message);
    }
  }

  static Future<Map<String, dynamic>> forgotpass(
      String nik, String password) async {
    try {
      Response response =
          await DioService.init().post("/auth/forgotpass", data: {
        "user_nik": nik,
        "user_password": password,
      });
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
      return ResponseUtils.errorServer(e.message.toString());
    }
  }

  static Future<Map<String, dynamic>> register(UserModel model) async {
    try {
      Response response =
          await DioService.init().post("/auth/register", data: model.toJson());
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
      return ResponseUtils.errorServer(e.message.toString());
    }
  }

  static Future<Map<String, dynamic>> changePass(
      String oldPassword, String newPassword) async {
    try {
      Dio dio = await DioService.withToken();
      Response response = await dio.put("/auth/changepass", data: {
        "old_password": oldPassword,
        "new_password": newPassword,
      });
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
      return ResponseUtils.errorServer(e.message.toString());
    }
  }
}
