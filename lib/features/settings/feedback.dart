import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extention.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/loading.dart';
import 'user_bloc/user_bloc.dart';
import 'widgets/custom_button.dart';
import 'widgets/feedback_textfield.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});
  static const String routeName = '/feedback';

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _feedbackController;
  @override
  void initState() {
    _feedbackController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const CustomBackButton()),
            body: Padding(
              padding: EdgeInsets.all(35.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Give us your feedback',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FeedbackTextfield(
                      controller: _feedbackController,
                    ),
                    const Spacer(),
                    CustomButton(
                      title: 'Submit',
                      color: const Color(0xff38A94A),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserBloc>().add(
                              UserEvent.sendFeedback(_feedbackController.text));
                        }
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
