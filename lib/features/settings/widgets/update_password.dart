import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/const.dart';
import '../../../shared/widgets/password_text_field.dart';
import '../user_bloc/user_bloc.dart';

class UpdatePasswordButton extends StatelessWidget {
  const UpdatePasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return const AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: UpdatePassword(),
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 27.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kCornerButtonRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Text('Change Password',
                  style: Theme.of(context).textTheme.bodyMedium!),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ));
  }
}

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

late TextEditingController _currentPasswordController;

class _UpdatePasswordState extends State<UpdatePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {};
  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Update Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter your current password and a new password to update your password',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                    hintText: 'Current Password',
                    mapKey: 'currentPassword',
                    data: data,
                    validator: validatePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                    hintText: 'New Password',
                    mapKey: 'newPassword',
                    data: data,
                    validator: validatePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                    hintText: 'Confirm Password',
                    data: data,
                    mapKey: 'confirmpassword',
                    textEditingController: _currentPasswordController,
                    validator: (value) {
                      if (value != _currentPasswordController.text) {
                        return 'passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print(_currentPasswordController.text);
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<UserBloc>().add(
                                UserEvent.updateUserPassword(
                                    data['currentPassword'],
                                    data['newPassword']));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: kBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
