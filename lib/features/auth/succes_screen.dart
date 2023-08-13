import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/core/extention.dart';

import '../../shared/widgets/background.dart';
import 'auth_screen.dart';

class SuccesScreen extends StatelessWidget {
  static String routeName = '/succes';
  const SuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
        child: Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              "Congratulations",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70.r,
              backgroundColor: Color(0xff0D9D58),
              child: Icon(
                Icons.check,
                size: 70.h,
                color: Colors.white,
              ),
            ),
            const Spacer(
              flex: 6,
            ),
            LoginButton(
              onPressed: () {
                context.pop();
              },
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    ));
  }
}
