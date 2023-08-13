import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 9.sp,
      color: Colors.black,
    ),
    // Button
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // Hint Text
    labelSmall: TextStyle(
      fontSize: 14.sp,
      color: const Color(0xff847E7E),
    ),
  );
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        shadowColor: Colors.black.withOpacity(0.05),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'ProductSans',
        textTheme: AppTheme.textTheme,
        dividerColor: Colors.black.withOpacity(0.05),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: false,
          toolbarHeight: 70,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kBlue,
        ),
        iconTheme: const IconThemeData(
          color: kIconLightColor,
          size: 25,
        ),
        buttonTheme: const ButtonThemeData(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kBlue),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: 10.sp,
                vertical: 5.sp,
              ),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kCornerButtonRadius,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
