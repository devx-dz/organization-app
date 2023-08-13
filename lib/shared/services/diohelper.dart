import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../core/const.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: uri,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(url,
        queryParameters: query,
        options: Options(
          headers: {
            'authorization': token,
          },
        ));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio.post(url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            'authorization': token,
          },
        ));
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio.put(url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            'authorization': token,
          },
        ));
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
    );
  }

  static Future<String> uploadImage(
    String? path,
    String url,
    String token, {
    Map<String, String>? data,
    String method = 'PUT',
  }) async {
    http.MultipartRequest req =
        http.MultipartRequest(method, Uri.parse('$uri/$url'));
    req.headers.addAll({
      'authorization': token,
    });
    if (path != null) {
      req.files.add(await http.MultipartFile.fromPath('images', path));
    }
    if (data != null) {
      req.fields.addAll(data);
    }

    http.StreamedResponse res = await req.send();
    return await res.stream.bytesToString();
  }
}
