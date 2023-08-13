import 'package:flutter/material.dart';

class FeedbackTextfield extends StatelessWidget {
  const FeedbackTextfield({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 2))
      ]),
      child: TextFormField(
        controller: controller,
        maxLines: 10,
        autocorrect: true,
        validator: (value) {
          if (value != null && value.isEmpty) {
            return 'Please enter your message';
          }
          return null;
        },
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            filled: true,
            errorStyle: TextStyle(fontSize: 12, color: Colors.red),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: 'Enter your message ',
            hintStyle: TextStyle(fontSize: 14, color: Color(0xff847E7E))),
      ),
    );
  }
}
