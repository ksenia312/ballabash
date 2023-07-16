import 'dart:math';

import 'package:flutter/material.dart';

class LevelVM extends ChangeNotifier {
  bool isDragging = false;
  int counter = 0;
  Offset targetOffset = Offset.zero;

  void setDragging(bool value) {
    isDragging = value;
    notifyListeners();
  }

  void setOffset(Offset value) {
    targetOffset = value;
    notifyListeners();
  }

  void decrement() {
    counter = max(counter - 1, 0);
    notifyListeners();
  }

  void countGoals(
    BuildContext context, {
    required RelativeRect dotRect,
    required ValueChanged<int> onDotRemove,
    required double targetR,
    required double dotR,
  }) {
    final targetX = targetOffset.dx + targetR;
    final targetY = targetOffset.dy + targetR;
    final dotX = dotRect.left + dotR;
    final dotY = dotRect.top + dotR;

    final distance = sqrt(pow(targetX - dotX, 2) + pow(targetY - dotY, 2));

    if (distance <= targetR + dotR) {
      counter++;
      onDotRemove(counter);
      notifyListeners();
    }
  }
}
