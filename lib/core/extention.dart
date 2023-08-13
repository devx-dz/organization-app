import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get lighter => Color.fromARGB(
        alpha,
        (red + 255) ~/ 2,
        (green + 255) ~/ 2,
        (blue + 255) ~/ 2,
      );
  Color get darker => Color.fromARGB(
        alpha,
        red ~/ 2,
        green ~/ 2,
        blue ~/ 2,
      );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension GetTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension Navigation on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }
}

extension Capitalize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
