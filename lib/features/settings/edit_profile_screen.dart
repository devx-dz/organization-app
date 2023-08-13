import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const.dart';
import '../../logic/auth_bloc/auth_bloc.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_textfield.dart';
import '../../shared/widgets/loading.dart';
import 'user_bloc/user_bloc.dart';
import 'widgets/update_password.dart';
import 'widgets/user_info.dart';

part 'widgets/textfield.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  static const String routeName = '/editprofile';

  Map<String, dynamic> data = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(
          child: Scaffold(
              appBar: CustomAppBar(
                currentIndex: 4,
                title: 'Settings',
                showBackButton: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.sp),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UserInfo(),
                        SizedBox(height: 30.sp),
                        CustomTextField(
                          initialValue:
                              context.watch<AuthBloc>().user.firstname,
                          keyboardType: TextInputType.name,
                          data: data,
                          validator: (p0) => p0!.isEmpty
                              ? 'Please enter your first name'
                              : null,
                          mapKey: 'firstname',
                        ),
                        CustomTextField(
                          initialValue: context.watch<AuthBloc>().user.lastname,
                          keyboardType: TextInputType.name,
                          data: data,
                          validator: (p0) => p0!.isEmpty
                              ? 'Please enter your last name'
                              : null,
                          mapKey: 'lastname',
                        ),
                        CustomTextField(
                          initialValue: context.watch<AuthBloc>().user.email,
                          keyboardType: TextInputType.emailAddress,
                          data: data,
                          validator: validateEmail,
                          mapKey: 'email',
                        ),
                        CustomTextField(
                          initialValue: context.watch<AuthBloc>().user.phone,
                          keyboardType: TextInputType.phone,
                          data: data,
                          validator: (p0) => p0!.isEmpty && p0.length < 8
                              ? 'Please enter your phone number'
                              : null,
                          mapKey: 'phone',
                        ),
                        const UpdatePasswordButton(),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context
                                  .read<UserBloc>()
                                  .add(UserEvent.updateUser(data));
                            }
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 20.sp)),
                            backgroundColor: MaterialStateProperty.all(kBlue),
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
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
