import 'package:dio/dio.dart';

import '../../../shared/services/diohelper.dart';

class AuthApi {
  static Future<Response> login(
    String email,
    String password,
  ) async {
    return await DioHelper.postData(
      url: '/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<Response> getUser(String token) async {
    return await DioHelper.getData(
      url: '/user/',
      token: token,
    );
  }

  static Future<Response> updateFcmtoken(String token, String fcmToken) async {
    return await DioHelper.putData(
      url: '/user/fcm/:id',
      token: token,
      data: {
        'fcmToken': fcmToken,
      },
    );
  }

  static Future<Response> generatePasswordReset(String email) async {
    return await DioHelper.postData(
      url: '/user/requestresetcode',
      data: {
        'email': email,
      },
    );
  }

  static Future<Response> confirmCode(String code, String email) async {
    return await DioHelper.postData(
      url: '/user/verifyresetcode',
      data: {'code': code, "email": email},
    );
  }

  static Future<Response> resetPassword(
      String password, String email, String code) async {
    return await DioHelper.postData(
      url: '/user/resetpassword',
      data: {'password': password, 'email': email, 'code': code},
    );
  }
}
