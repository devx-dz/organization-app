import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.initialValue,
      required this.keyboardType,
      this.data,
      this.validator,
      this.mapKey,
      this.hintText});
  final String? initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        autocorrect: false,
        validator: validator,
        onSaved: (newValue) => data![mapKey!] = newValue!,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.sp, vertical: 25.sp),
            border: kOutlineInputBorder,
            focusedBorder: kFucusOutlineInputBorder,
            errorBorder: kErorrOutlineInputBorder,
            errorStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.red)),
      ),
    );
  }
}
