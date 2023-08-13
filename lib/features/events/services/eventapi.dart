import 'package:dio/dio.dart';

import '../../../shared/services/diohelper.dart';
import '../models/event.dart';

class EventApi {
  static Future<List<Event>> getEvents(String token) async {
    try {
      final res = await DioHelper.getData(url: '/event/all', token: token);

      if (res.statusCode == 200) {
        final events = res.data['events'] as List;
        return events.map((e) => Event.fromJson(e)).toList();
      } else {
        throw Exception(res.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }

  static Future<List<Event>> getUserEvents(String token) async {
    try {
      final res = await DioHelper.getData(url: '/event/user', token: token);
      print(res.data);
      if (res.statusCode == 200) {
        final events = res.data['data'] as List;
        return events.map((e) => Event.fromJson(e)).toList();
      } else {
        throw Exception(res.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }

  static Future<Response> submiteOrganizer(
      String motivation, String id, String token) async {
    try {
      final res = await DioHelper.postData(
          url: '/submission/sendsubmission/$id',
          data: {'motivation': motivation},
          token: token);
      return res;
    } catch (e) {
      print(e);
      throw Exception('Something went wrong');
    }
  }
}
