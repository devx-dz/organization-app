import 'package:flutter/material.dart';

import '../../core/const.dart';


class SuccessPopup extends StatelessWidget {
  const SuccessPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 120,
      width: 50,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.check_circle_outline,
              color: kGreen,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 120,
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              error,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.error_outline,
              color: kRed,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
