import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../logic/togglecubit.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      this.initialValue,
      this.data,
      this.validator,
      this.mapKey,
      this.textEditingController,
      this.hintText});
  final String? initialValue;
  final String? hintText;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit(),
      child: BlocBuilder<ToggelCubit, bool>(
        builder: (context, state) {
          return Container(
            decoration: kBoxDecoration,
            child: TextFormField(
              autocorrect: false,
              obscureText: !state,
              controller: textEditingController,
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: initialValue,
              onSaved: (newValue) => data![mapKey ?? 'password'] = newValue!,
              validator: validator,
              enableSuggestions: false,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hintText,
                  errorBorder: kErorrOutlineInputBorder,
                  focusedErrorBorder: kFucusOutlineInputBorder,
                  suffixIcon: IconButton(
                    icon: Icon(state ? IconlyLight.show : IconlyLight.hide),
                    onPressed: () {
                      context.read<ToggelCubit>().toggle();
                    },
                  ),
                  focusedBorder: kFucusOutlineInputBorder,
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  border: kOutlineInputBorder,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.red)),
            ),
          );
        },
      ),
    );
  }
}
