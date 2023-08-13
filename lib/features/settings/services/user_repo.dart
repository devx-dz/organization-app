import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../shared/services/diohelper.dart';
import '../../notification/model/notification.dart';
import 'user_api.dart';

class UserRepo {
  static Future<Response> updateUser(
      String token, Map<String, dynamic> data) async {
    final Response response = await UserApi.updateUser(token, data);
    return response;
  }

  static Future<Response> sendFeedback(String token, String feedback) async {
    final Response response = await UserApi.sendFeedback(token, feedback);
    return response;
  }

  static Future<Map<String, dynamic>> updateimage(
      String token, String image) async {
    final String response = await DioHelper.uploadImage(
      image,
      "user/image",
      token,
    );
    print(response);
    return jsonDecode(response);
  }

  static Future<Response> updatePassword(
      String token, String oldpassword, String newpassword) async {
    final Response response =
        await UserApi.updatePassword(token, oldpassword, newpassword);
    return response;
  }

  static Future<Map<String, dynamic>> reportBug(
      String message, String type, String token, String? image) async {
    final res = await DioHelper.uploadImage(
      image,
      'user/reportbug',
      token,
      method: "POST",
      data: {
        'message': message,
        'type': type,
      },
    );

    return jsonDecode(res);
  }

  static Future<List<Notif>> getNotification(String token) async {
    try {
      final res =
          await DioHelper.getData(url: '/user/notifications', token: token);
      final notification = res.data['data'] as List;
      print(notification);
      return notification.map((e) => Notif.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }

  static Future<Response> readNotification(String token) async {
    final res = await DioHelper.putData(
        url: '/user/readnotification', token: token, data: {});
    return res;
  }
}
