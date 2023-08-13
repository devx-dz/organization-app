import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/const.dart';
import '../../../core/extention.dart';
import '../user_bloc/user_bloc.dart';
import 'custom_button.dart';
import 'feedback_textfield.dart';

class BugWidget extends StatelessWidget {
  const BugWidget({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String groupValue;
  final Function(String?) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 16.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Radio(
              activeColor: const Color(0xff38A94A),
              value: title,
              groupValue: groupValue,
              onChanged: onTap),
        ],
      ),
    );
  }
}

class BugPopUp extends StatefulWidget {
  const BugPopUp({
    super.key,
  });

  @override
  State<BugPopUp> createState() => _BugPopUpState();
}

class _BugPopUpState extends State<BugPopUp> {
  XFile? image;
  late TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kLightGrey,
      title: Text(
        'Bug Description : ',
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 470.h,
        width: 350.w,
        child: Form(
          key: _formKey,
          child: Column(children: [
            FeedbackTextfield(
              controller: _controller,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  label: const Text(
                    'Upload screenshot',
                    style: TextStyle(color: kBlue, fontSize: 10),
                  ),
                  icon: const Icon(
                    IconlyBold.upload,
                    color: kBlue,
                    size: 15,
                  ),
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final image =
                        await picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      this.image = image;
                    });
                  },
                ),
              ],
            ),
            if (image != null)
              Text(
                'Image Selected :${image!.name}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    title: 'Cancel',
                    color: Colors.white,
                    onTap: () {
                      context.pop();
                    },
                    size: Size(135.w, 32.h),
                    textStyle: context.textTheme.labelMedium!
                        .copyWith(color: Colors.red),
                    border: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide(color: Colors.red, width: 1))),
                CustomButton(
                  title: 'Submit',
                  size: Size(135.w, 32.h),
                  color: kGreen,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<UserBloc>().add(UserEvent.sendReport(
                          _controller.text,
                          image != null ? image!.path : null));
                      context.pop();
                    }
                  },
                  textStyle: context.textTheme.labelMedium!
                      .copyWith(color: Colors.white),
                  border: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
