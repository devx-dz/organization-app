import 'package:dio/dio.dart';

import '../../../shared/services/diohelper.dart';

class UserApi {
  static Future<Response> updateUser(
      String token, Map<String, dynamic> data) async {
    return await DioHelper.putData(
      url: '/user/',
      token: token,
      data: data,
    );
  }

  static Future<Response> sendFeedback(String token, String feedback) async {
    return await DioHelper.postData(
      url: '/user/feedback',
      token: token,
      data: {
        'content': feedback,
      },
    );
  }

  static Future<Response> updatePassword(
      String token, String oldpassword, String newpassword) async {
    return await DioHelper.putData(
      url: '/user/password',
      token: token,
      data: {
        'oldpassword': oldpassword,
        'newpassword': newpassword,
      },
    );
  }
}
