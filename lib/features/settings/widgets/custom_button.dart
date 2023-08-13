import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    required this.border,
    required this.size,
    required this.textStyle,
  });
  final String title;
  final Color color;
  final void Function()? onTap;
  final OutlinedBorder border;
  final Size size;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: border,
            minimumSize: size,
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: textStyle,
          )),
    );
  }
}
