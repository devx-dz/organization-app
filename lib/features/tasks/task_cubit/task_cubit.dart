import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/services/authrepo.dart';
import '../models/task.dart';
import '../utils/tasksapi.dart';

part 'task_cubit.freezed.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState.initial());

  static List<Task> doneTasks = [];
  static List<Task> newTasks = [];

  void getTasks() async {
    emit(const TaskState.loading());
    try {
      final String? token = await AuthRepo.token;
      if (token == null) {
        emit(const TaskState.initial());
        return;
      }

      final tasks = await TaskApi.getTasks(token);
      if (tasks.isEmpty) {
        emit(const TaskState.error('No tasks found'));
        return;
      } else {
        doneTasks =
            tasks.where((element) => element.state == 'completed').toList();
        newTasks =
            tasks.where((element) => element.state != 'completed').toList();
        emit(TaskState.loaded(doneTasks, newTasks));
      }
    } catch (e) {
      emit(const TaskState.error('Something went Wrong'));
    }
  }

  void editTask(String id, String? raport) async {
    emit(const TaskState.loading());
    try {
      final String? token = await AuthRepo.token;
      if (token == null) {
        emit(const TaskState.initial());
        return;
      }
      final Task? task = await TaskApi.editTask(id, token, raport);
      print(task);

      if (task == null) {
        emit(TaskState.error('Something went wrong'));
        return;
      } else {
        if (task.state == "completed") {
          newTasks.removeWhere((e) => e.id == id);

          doneTasks.add(task);
        } else {
          doneTasks.removeWhere((e) => e.id == id);

          newTasks.add(task);
        }
        emit(TaskState.loaded(doneTasks, newTasks));
        return;
      }
    } catch (e) {
      print(e);
      emit(const TaskState.error('Something went wrong'));
    }
  }
}
