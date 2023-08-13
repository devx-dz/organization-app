import 'package:flutter/material.dart';

import '../../core/const.dart';
import 'gdg_logo.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    this.color = kBlue,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
        child: const Center(
          child: GdgLogo(
            size: 20,
          ),
        ));
  }
}
