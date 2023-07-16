import 'package:flutter/material.dart';

class AppModel {
  AppModel({
    required this.levelsCount,
    required this.current,
  });

  final int levelsCount;
  final int current;

  static const disabledColor = Color(0xFFA6A6A6);

  static const currentColor = Color(0xFFC20537);

  static const enabledColor = Color(0xFFF06292);

  bool isEnabled(int number) {
    return number <= current;
  }

  bool isCurrent(int number) {
    return number == current;
  }

  Color getHomeColor(int number) {
    if (isCurrent(number)) {
      return currentColor;
    }
    if (isEnabled(number)) {
      return enabledColor;
    }
    return disabledColor;
  }
}
