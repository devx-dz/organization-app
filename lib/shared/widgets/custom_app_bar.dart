import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/features/notification/logic/notification_cubit.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/const.dart';
import '../../features/notification/notification_screen.dart';
import '../../features/settings/user_bloc/user_bloc.dart';
import '../../logic/auth_bloc/auth_bloc.dart';
import '../../logic/imagecubit.dart';
import 'cover_pic.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      required this.currentIndex,
      this.showBackButton = false});
  final String title;
  final int currentIndex;
  final bool showBackButton;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: currentIndex > 2 ? CustomShape() : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: currentIndex > 2 ? const Color(0XffF9F9F9) : Colors.white,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: currentIndex < 3
                ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h)
                : const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Row(
              children: [
                if (showBackButton) const CustomBackButton(),
                if (currentIndex < 3) const WelcomText(),
                const Spacer(),
                if (currentIndex < 3) const NotificationButton(),
                if (currentIndex < 3)
                  SizedBox(
                    width: 40.w,
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: currentIndex < 3 ? 20.w : 0),
          child: ProfilePhoto(currentIndex: currentIndex, picker: _picker),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(currentIndex > 2 ? 200 : 60);
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.currentIndex,
    required ImagePicker picker,
  }) : _picker = picker;

  final int currentIndex;
  final ImagePicker _picker;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 500),
        alignment:
            currentIndex < 3 ? Alignment.topRight : Alignment.bottomCenter,
        child: CoverPhoto(
          coverPhotoUrl: context.watch<AuthBloc>().user.image!,
          showCoverPhotoOptions: () {
            showDialog(
              context: context,
              builder: (_) {
                return BlocBuilder<ImageCubit, XFile?>(
                  builder: (context, state) {
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(0),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (context.read<ImageCubit>().state != null)
                            Container(
                              margin: const EdgeInsets.all(20),
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kBlue,
                                  width: 4,
                                ),
                                image: DecorationImage(
                                  image: FileImage(
                                    File(
                                        context.read<ImageCubit>().state!.path),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (context.read<ImageCubit>().state == null)
                            CachedNetworkImage(
                              imageUrl: context.watch<AuthBloc>().user.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                margin: const EdgeInsets.all(20),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kBlue,
                                    width: 4,
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ListTile(
                            onTap: () async {
                              _picker
                                  .pickImage(source: ImageSource.camera)
                                  .then((value) => context
                                      .read<ImageCubit>()
                                      .changeCoverPhoto(value));
                            },
                            leading: const Icon(IconlyBold.home),
                            title: const Text(
                              'Camera',
                            ),
                          ),
                          ListTile(
                            onTap: () async {
                              _picker
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) => context
                                      .read<ImageCubit>()
                                      .changeCoverPhoto(value));
                            },
                            leading: const Icon(IconlyBold.activity),
                            title: const Text('Gallery'),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context.read<ImageCubit>().clear();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: kRed),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      if (state != null) {
                                        context
                                            .read<UserBloc>()
                                            .add(UserEvent.updateUserImage(
                                              state.path,
                                            ));
                                        context.read<ImageCubit>().clear();
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Done',
                                      style: TextStyle(color: kBlue),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          showBackButton: currentIndex > 2,
          hideEditButton: currentIndex < 4,
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<NotificationCubit>().readnotification();
          Navigator.pushNamed(context, Notifications.routeName);
        },
        icon: Badge(
          backgroundColor:
              context.watch<NotificationCubit>().newNotificationCount > 0
                  ? kRed
                  : Colors.transparent,
          alignment: const Alignment(0.5, -1),
          child: const Icon(
            IconlyLight.notification,
            color: kBlue,
          ),
        ));
  }
}

class WelcomText extends StatelessWidget {
  const WelcomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w500),
      children: [
        TextSpan(
            text: 'Welcome , ',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w400)),
        TextSpan(
          text: context.watch<AuthBloc>().user.firstname.capitalize(),
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    ));
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height + 50, width, height - 100);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ChooseImage extends StatelessWidget {
  const ChooseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [],
      ),
    );
  }
}
