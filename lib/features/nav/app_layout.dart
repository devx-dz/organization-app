import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/features/notification/logic/notification_cubit.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/loading.dart';
import '../../shared/widgets/pop_up.dart';
import '../events/cubit/event_cubit.dart';
import '../home/post_cubit/posts_cubit.dart';
import '../settings/user_bloc/user_bloc.dart';
import '../tasks/task_cubit/task_cubit.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    context.read<EventCubit>().getEvents();
    context.read<TaskCubit>().getTasks();
    context.read<PostsCubit>().getPosts();
    context.read<NotificationCubit>().getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
      builder: (context, state) {
        NavigationCubit appCubit = NavigationCubit.get(context);
        return Stack(
          children: [
            BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                state.maybeMap(
                    orElse: () {},
                    failure: (value) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: ErrorPopUp(
                                error: value.message,
                              ));
                        },
                      );
                    },
                    success: (state) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: SuccessPopup(),
                          );
                        },
                      );
                    });
              },
              child: BackGroundImage(
                child: Scaffold(
                  appBar: CustomAppBar(
                    currentIndex: appCubit.currentIndex,
                    title: appCubit.appBarTitles[appCubit.currentIndex],
                  ),
                  body: appCubit.screens[appCubit.currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: kBlue,
                    unselectedItemColor: kBlue,
                    onTap: (value) {
                      appCubit.changeIndex(value);
                    },
                    currentIndex: appCubit.currentIndex,
                    items: const [
                      BottomNavigationBarItem(
                          label: 'home',
                          icon: Icon(IconlyLight.home),
                          activeIcon: Icon(IconlyBold.home)),
                      BottomNavigationBarItem(
                          label: 'task',
                          icon: Icon(IconlyLight.activity),
                          activeIcon: Icon(IconlyBold.activity)),
                      BottomNavigationBarItem(
                          label: 'events',
                          icon: Icon(IconlyLight.calendar),
                          activeIcon: Icon(IconlyBold.calendar)),
                      BottomNavigationBarItem(
                          label: 'Settengs',
                          icon: Icon(IconlyLight.profile),
                          activeIcon: Icon(IconlyBold.profile)),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
                builder: (context, state) => state.maybeMap(
                    orElse: () => const SizedBox.shrink(),
                    loading: (value) => Loading(
                          color: Colors.black.withOpacity(0.4),
                        )))
          ],
        );
      },
    );
  }
}
