import '../../../shared/services/diohelper.dart';
import '../models/task.dart';

class TaskApi {
  static Future<List<Task>> getTasks(String token) async {
    final res = await DioHelper.getData(url: '/task/user/:id', token: token);
    try {
      if (res.statusCode == 200) {
        final tasks = res.data['tasks'] as List;
        return tasks.map((e) => Task.fromJson(e)).toList();
      } else {
        throw Exception(res.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      print(res.data);
      print(e);
      throw Exception(res.data['message'] ?? 'Something went wrong');
    }
  }

  static Future<Task?> editTask(
      String taskId, String token, String? report) async {
    try {
      final res = await DioHelper.putData(
          url: '/task/updatetaskstate/$taskId',
          token: token,
          data: {'report': report});
      return Task.fromJson(res.data['data']);
    } catch (e) {
      print('object');
      throw Exception('Somthing went wrong');
    }
  }
}
