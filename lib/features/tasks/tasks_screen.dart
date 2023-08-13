import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/shared/widgets/error_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const.dart';
import '../../core/extention.dart';
import '../../logic/togglecubit.dart';
import '../settings/widgets/custom_button.dart';
import 'models/task.dart';
import 'task_cubit/task_cubit.dart';

part 'widgets/task_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TaskCubit>().getTasks();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Title(
              title: 'In Progress',
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return state.when(
                    loaded: (_, tasks) => Column(
                        children:
                            tasks.map((e) => TaskWidget(task: e)).toList()),
                    initial: () => const SizedBox.shrink(),
                    loading: () => Column(
                          children:
                              List.generate(2, (index) => const TaskShimmer()),
                        ),
                    error: (e) => ErrorState(
                          err: e,
                          scale: 0.3,
                        ));
              },
            ),
            const Title(
              title: 'Done',
              color: Colors.green,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => Column(
                          children:
                              List.generate(2, (index) => const TaskShimmer()),
                        ),
                    loaded: (doneTasks, _) => Column(
                        children:
                            doneTasks.map((e) => TaskWidget(task: e)).toList()),
                    error: (e) => ErrorState(
                          err: e,
                          scale: 0.3,
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
