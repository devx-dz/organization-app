import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';
import 'package:gdg_organizers_app/shared/widgets/custom_app_bar.dart';

import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_circular_loader.dart';
import '../../shared/widgets/custom_textfield.dart';
import 'auth_screen.dart';
import 'bloc/forget_password_bloc.dart';
import 'confirm_code.dart';

class ConfirmEmail extends StatelessWidget {
  static String routeName = '/confirmemail';
  ConfirmEmail({super.key});
  final _formKey = GlobalKey<FormState>();
  Map<String, String> data = {};

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeMap(
            orElse: () {},
            success: (_) {
              context.pushReplacementNamed(ConfirmCode.routeName);
            });
      },
      child: BackGroundImage(
          child: Scaffold(
        appBar: const ResetPasswordAppbar(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(36), vertical: 10),
              child: Form(
                key: _formKey,
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Your Email',
                  data: data,
                  mapKey: "email",
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
              builder: (context, state) {
                return state.maybeMap(
                    orElse: () => LoginButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<ForgetPasswordBloc>().add(
                                  ForgetPasswordEvent.emailSend(
                                      email: data['email']!));
                            }
                          },
                        ),
                    loading: (_) {
                      return const CustomLoader();
                    });
              },
            )
          ],
        ),
      )),
    );
  }
}

class ResetPasswordAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ResetPasswordAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const CustomBackButton(),
      title: Text(
        'Reset your password',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Color(0xff0C1D4A), fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setHeight(80));
}
