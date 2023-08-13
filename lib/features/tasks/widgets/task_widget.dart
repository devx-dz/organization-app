part of '../tasks_screen.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 86.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text('${task.datedebut}  ${task.duration}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: kGrey,
                    )),
              ],
            ),
          ),
          const Spacer(),
          CustomCheckbox(isChecked: task.state == 'completed', task: task),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.isChecked, required this.task});
  final bool isChecked;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit()..set(isChecked),
      child: BlocBuilder<ToggelCubit, bool>(
        builder: (context, state) {
          return Transform.scale(
            scale: 1.3,
            child: Checkbox(
              checkColor: Colors.green,
              fillColor: MaterialStateProperty.all(Colors.white),
              side: const BorderSide(
                color: kGrey,
                width: 1,
              ),
              activeColor: Colors.green,
              value: state,
              onChanged: (value) {
                showDialog(
                    context: context,
                    builder: (_) => TaskRaport(
                          task: task,
                        ));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: kGrey)),
            ),
          );
        },
      ),
    );
  }
}

class TaskRaport extends StatelessWidget {
  const TaskRaport({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return AlertDialog(
      title: Text(
        'Task Completed',
        style: context.textTheme.titleMedium,
      ),
      backgroundColor: kLightGrey,
      content: SizedBox(
        height: 250.h,
        width: 300.w,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 2))
              ], borderRadius: BorderRadius.circular(8)),
              child: TextField(
                maxLines: 6,
                controller: textEditingController,
                style: context.textTheme.bodyMedium!.copyWith(fontSize: 12),
                decoration: InputDecoration(
                    hintText: "Any thing to add ?",
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Color(0xff847E7E)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: InputBorder.none),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    title: 'Cancel',
                    color: Colors.white,
                    onTap: () {
                      context.pop();
                    },
                    size: Size(135.w, 32.h),
                    textStyle: context.textTheme.labelMedium!
                        .copyWith(color: Colors.red),
                    border: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide(color: Colors.red, width: 1))),
                CustomButton(
                  title: 'Submit',
                  size: Size(135.w, 32.h),
                  color: kGreen,
                  onTap: () {
                    context.pop();
                    context
                        .read<TaskCubit>()
                        .editTask(task.id, textEditingController.text);
                  },
                  textStyle: context.textTheme.labelMedium!
                      .copyWith(color: Colors.white),
                  border: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
                margin: const EdgeInsets.all(15),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                )),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key, this.color = Colors.black, required this.title});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        top: 15,
      ),
      child: Text(
        title,
        style:
            TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: color),
      ),
    );
  }
}
