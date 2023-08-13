import 'package:flutter/material.dart';

final kBoxDecorationForTask = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  gradient: const LinearGradient(colors: [
    Color(0xFF0D9D58),
    Color(0xFF4285F4),
    Color(0xFFFFCA32),
    Color(0xFFEA4334),
  ]),
);
const kBoxDecorationForEvents = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xff4dea4334),
        blurRadius: 4,
        spreadRadius: 5.0,
        offset: Offset(
          0,
          2.0,
        ),
      )
    ]);
const emaillinearGradient = LinearGradient(
  colors: [
    Color(0xFFEA4334),
    Color(0xFF0D9D58),
  ],
);
const passwordlinearGradient = LinearGradient(
  colors: [
    Color(0xFF4285F4),
    Color(0xFFFFCA32),
  ],
);
const OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6.73),
  ),
  borderSide: BorderSide.none,
);
const OutlineInputBorder kFucusOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6.73),
  ),
  borderSide: BorderSide(
    color: Color(0XFF2B6ED1),
    width: 1,
  ),
);
const OutlineInputBorder kErorrOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6.73),
  ),
  borderSide: BorderSide(
    color: Color(0XffEA4334),
    width: 1,
  ),
);
const OutlineInputBorder kSuccessOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6.73),
  ),
  borderSide: BorderSide(
    color: Color(0Xff0D9D58),
    width: 1,
  ),
);

const kBoxDecoration = BoxDecoration(
  color: Colors.transparent,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 4,
      spreadRadius: 0,
      offset: Offset(
        0,
        3.36,
      ),
    )
  ],
);
const kBoxDecorationForEvent = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(16)),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      blurRadius: 1,
      spreadRadius: 3,
      offset: Offset(
        0,
        2,
      ),
    )
  ],
);

const kInputDecoration = InputDecoration(
  iconColor: Color(0xFF676C72),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kCornerInputRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kBlue,
      width: 2,
    ),
    borderRadius: BorderRadius.all(Radius.circular(kCornerInputRadius)),
  ),
);

const String images = 'assets/images';
const String icons = 'assets/icons/';
const kGreen = Color(0xFF0D9D58);
const kBlue = Color(0xFF1976D2);
const kRed = Color(0xFFEA4334);
const kLightGrey = Color(0xfffafafa);
const kGrey = Color(0Xff757575);
const blue = Color(0xFF0F0088);
const cyan = Color(0xFF27E1BC);
const darkBlue = Color(0xFF181340);

const kYellow = Color(0xFFFFCA32);
const kTextLightColor = Color(0xff5A5A5F);
const kThinTextLightColor = Color(0xff9c9c9c);
const kIconLightColor = Color(0xff407056);
const kInputBorderLightColor = Color(0xffC4C4C4);
const kScaffoldLightBackgroundColor = Color(0xfff7f7f7);
LinearGradient kLinearGradientBlueColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF1976D2).withOpacity(.4),
      Colors.transparent,
    ]);

const kCornerRadius = 25.0;
const kCornerInputRadius = 20.0;
const kCornerButtonRadius = 10.0;

const String uri = 'https://organizers-app-api.onrender.com/api';
// const String socketUri = "https://organizers-app-api.onrender.com";

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null) {
    return 'Please enter password';
  } else if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (value.length < 10) {
      return 'Password  must be of 10 character';
    } else {
      return null;
    }
  }
}

List<String> reports = [
  'Bug',
  'Spam',
  "Can't find my event",
  "Others",
];
