// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/features/settings/user_bloc/user_bloc.dart';
import 'package:gdg_organizers_app/features/settings/widgets/bug_report.dart';
import 'package:gdg_organizers_app/features/settings/widgets/custom_button.dart';

import '../../core/const.dart';
import '../../core/extention.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/loading.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  static const String routename = '/reportbug';

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String value = reports[0];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const CustomBackButton(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Report an issue',
                      style: context.textTheme.titleMedium!),
                  Column(
                    children: List.generate(
                        reports.length,
                        (index) => BugWidget(
                              title: reports[index],
                              groupValue: value,
                              onTap: (val) {
                                setState(() {
                                  value = reports[index];
                                });
                              },
                            )),
                  ),
                  const Spacer(),
                  CustomButton(
                    title: 'Continue',
                    color: const Color(0xff38A94A),
                    onTap: () {
                      context.read<UserBloc>().setBugType(value);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const BugPopUp();
                        },
                      );
                    },
                    textStyle: context.textTheme.labelLarge!
                        .copyWith(color: Colors.white),
                    size: Size(double.infinity, 56.h),
                    border: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  CustomButton(
                      title: 'Cancel',
                      color: Colors.white,
                      textStyle: context.textTheme.labelLarge!
                          .copyWith(color: Colors.red),
                      onTap: () {
                        context.pop();
                      },
                      size: Size(double.infinity, 56.h),
                      border: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: Colors.red, width: 3))),
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
                  ),
                ))
      ],
    );
  }
}
