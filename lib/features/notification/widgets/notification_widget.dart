import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.title,
    required this.content,
    required this.read,
  });
  final bool read;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
          color:
              !read ? const Color.fromARGB(255, 204, 228, 248) : Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]),
      child: ListTile(
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          
          style: context.textTheme.titleMedium!.copyWith(
            color: !read ? Colors.black : Colors.black.withOpacity(0.6),
          ),
        ),
        subtitle: Text(
          content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium,
        ),
        leading: Icon(
          notificationIcon[Random().nextInt(notificationIcon.length)],
          color: kBlue,
        ),
      ),
    );
  }
}

class NotificationSheemer extends StatelessWidget {
  const NotificationSheemer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]),
      child: ListTile(
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20.h,
            width: 100.w,
            color: Colors.white,
          ),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20.h,
            width: 100.w,
            color: Colors.white,
          ),
        ),
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 40.h,
            width: 40.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

List<IconData> notificationIcon = [
  IconlyBold.activity,
  IconlyBold.notification,
  IconlyBold.paper,
  IconlyBold.play,
  IconlyBold.message,
];
