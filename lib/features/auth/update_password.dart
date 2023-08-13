import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../logic/togglecubit.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_circular_loader.dart';
import '../../shared/widgets/password_text_field.dart';
import 'auth_screen.dart';
import 'bloc/forget_password_bloc.dart';
import 'forgetpassword.dart';
import 'succes_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static String routeName = '/updatepassword';
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  Map<String, String> data = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _currentPasswordController;
  @override
  void initState() {
    _currentPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            success: () {
              context.pushReplacementNamed(SuccesScreen.routeName);
            });
      },
      child: BackGroundImage(
        child: Scaffold(
          appBar: const ResetPasswordAppbar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  PasswordTextField(
                    hintText: 'New Password',
                    mapKey: 'newpassword',
                    data: data,
                    validator: validatePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider(
                    create: (context) => ToggelCubit(),
                    child: BlocBuilder<ToggelCubit, bool>(
                      builder: (context, state) {
                        return Container(
                          decoration: kBoxDecoration,
                          child: TextFormField(
                            autocorrect: false,
                            obscureText: !state,
                            controller: _currentPasswordController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            onSaved: (newValue) =>
                                data['newpassword'] = newValue!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              } else if (value !=
                                  _currentPasswordController.text) {
                                return 'Password not match';
                              }
                              return null;
                            },
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Confirm Password',
                                errorBorder: kErorrOutlineInputBorder,
                                focusedErrorBorder: kFucusOutlineInputBorder,
                                suffixIcon: IconButton(
                                  icon: Icon(state
                                      ? IconlyLight.show
                                      : IconlyLight.hide),
                                  onPressed: () {
                                    context.read<ToggelCubit>().toggle();
                                  },
                                ),
                                focusedBorder: kFucusOutlineInputBorder,
                                hintStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                border: kOutlineInputBorder,
                                errorStyle: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.red)),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return LoginButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('object');
                                _formKey.currentState!.save();
                                context.read<ForgetPasswordBloc>().add(
                                    ForgetPasswordEvent.resetPassword(
                                        password: data['newpassword']!));
                              }
                            },
                          );
                        },
                        loading: () => const CustomLoader(),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
