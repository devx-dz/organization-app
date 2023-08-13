import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';

import '../../core/const.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_circular_loader.dart';
import 'auth_screen.dart';
import 'bloc/forget_password_bloc.dart';
import 'forgetpassword.dart';
import 'update_password.dart';

class ConfirmCode extends StatelessWidget {
  ConfirmCode({super.key});
  static String routeName = '/confirmcode';
  List<int> code = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          success: (_) {
            context.pushReplacementNamed(UpdatePasswordScreen.routeName);
          },
        );
      },
      child: BackGroundImage(
        child: Scaffold(
          appBar: const ResetPasswordAppbar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(36), vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpTextfield(
                        index: 0, first: true, last: false, code: code),
                    OtpTextfield(
                        index: 1, first: false, last: false, code: code),
                    OtpTextfield(
                        index: 2, first: false, last: false, code: code),
                    OtpTextfield(
                        index: 3, first: false, last: false, code: code),
                    OtpTextfield(
                        index: 4, first: false, last: false, code: code),
                    OtpTextfield(
                        index: 5, first: false, last: true, code: code),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const CustomLoader();
                    },
                    orElse: () {
                      return LoginButton(
                        onPressed: () {
                          if (code.length == 6) {
                            context.read<ForgetPasswordBloc>().add(
                                  ForgetPasswordEvent.resetPasswordCode(
                                    code: code.join(),
                                  ),
                                );
                          }
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpTextfield extends StatelessWidget {
  const OtpTextfield(
      {super.key,
      required this.first,
      required this.last,
      required this.code,
      required this.index});
  final bool first;
  final bool last;
  final List<int> code;
  final int index;

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(48),
      width: ScreenUtil().setWidth(48),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1) {
            code.insert(index, int.parse(value));

            if (last == false) {
              FocusScope.of(context).nextFocus();
            }
          }
          if (value == '') {
            if (first == false) {
              FocusScope.of(context).previousFocus();
            }
            code.removeAt(
              index,
            );
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: kBlue,
            ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5),
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: kBlue),
              borderRadius: BorderRadius.circular(5.37)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: kBlue),
              borderRadius: BorderRadius.circular(5.37)),
        ),
      ),
    );
  }
}
