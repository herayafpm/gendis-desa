abstract class ResponseUtils {
  static Map<String, dynamic> errorClient(String e) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = 400;
    data['message'] = e;
    return data;
  }

  static Map<String, dynamic> errorServer(String e) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = 500;
    data['message'] = e;
    return data;
  }

  static Map<String, dynamic> ok(String e) {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = 200;
    data['message'] = e;
    return data;
  }
}
