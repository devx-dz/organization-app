import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';
import 'package:gdg_organizers_app/features/notification/logic/notification_cubit.dart';
import 'package:gdg_organizers_app/features/notification/widgets/notification_widget.dart';
import 'package:gdg_organizers_app/shared/widgets/background.dart';
import 'package:gdg_organizers_app/shared/widgets/custom_app_bar.dart';

class Notifications extends StatefulWidget {
  static const String routeName = "/notifications";

  const Notifications({super.key});
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Notifications",
                style: context.textTheme.titleMedium,
              ),
              centerTitle: true,
              leading: const CustomBackButton(),
            ),
            body: BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              5, (index) => const NotificationSheemer()),
                        ),
                    success: (notifications) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return NotificationWidget(
                            content: notifications[index].body,
                            read: notifications[index].read,
                            title: notifications[index].title,
                          );
                        },
                        itemCount: notifications.length,
                      );
                    },
                    failure: (msg) => Center(
                          child: Text(msg),
                        ));
              },
            )));
  }
}
