import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/features/settings/edit_profile_screen.dart';
import 'package:gdg_organizers_app/features/settings/feedback.dart';
import 'package:gdg_organizers_app/features/settings/my_event_screen.dart';
import 'package:gdg_organizers_app/features/settings/report_bug.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../core/extention.dart';
import '../../logic/auth_bloc/auth_bloc.dart';
import 'widgets/user_info.dart';

part 'widgets/log_out.dart';
part 'widgets/settings_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //** General Section Data */
    final List<String> generalTexts = ['My Events', 'Account', 'Log out'];
    final List<IconData> generalIcons = [
      IconlyLight.star,
      IconlyLight.profile,
      IconlyLight.login
    ];
    final generalOnPressed = [
      () {
        context.pushNamed(MyEventsScreen.routeName);
      },
      () {
        context.pushNamed(EditProfile.routeName);
      },
      () {
        showDialog(
          context: context,
          builder: (_) {
            return const AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: LogoutPopUp(),
            );
          },
        );
      }
    ];

    //** Feedback Section Data */
    final List<String> feedbackTexts = ['Report a bug', 'Send a Feedback'];
    final List<IconData> feedbackIcons = [
      IconlyLight.paper_fail,
      IconlyLight.chat,
    ];
    final feedbackOnPressed = [
      () => context.pushNamed(ReportScreen.routename),
      () => context.pushNamed(FeedbackScreen.routeName),
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const UserInfo(),
          const SizedBox(
            height: 20,
          ),
          const Title(
            title: 'General',
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
              children: List.generate(generalTexts.length, (index) {
            return SettingButton(
              text: generalTexts[index],
              icon: generalIcons[index],
              onPressed: generalOnPressed[index],
            );
          })),
          const SizedBox(
            height: 20,
          ),
          const Title(title: 'Feedback'),
          const SizedBox(
            height: 10,
          ),
          Column(
              children: List.generate(feedbackTexts.length, (index) {
            return SettingButton(
              text: feedbackTexts[index],
              icon: feedbackIcons[index],
              onPressed: feedbackOnPressed[index],
            );
          })),
        ],
      ),
    );
  }
}
