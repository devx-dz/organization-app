import 'package:flutter/material.dart';

import '../../core/const.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("$images/Background.png"), fit: BoxFit.cover),
        ),
        child: child);
  }
}
