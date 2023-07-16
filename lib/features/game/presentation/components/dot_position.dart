import 'package:flutter/material.dart';

class DotPosition {
  DotPosition({
    required this.rect,
    required this.side,
  });

  final Rect rect;
  final DotSide side;
}

enum DotSide { top, left, right, bottom }

extension DotWorker on DotSide {
  static DotSide fromIndex(int index) {
    final candidates = DotSide.values.where((e) => e.index == index);
    if (candidates.isEmpty) {
      return DotSide.top;
    } else {
      return candidates.first;
    }
  }

  DotSide opposite() {
    switch (this) {
      case DotSide.top:
        return DotSide.bottom;
      case DotSide.bottom:
        return DotSide.top;
      case DotSide.left:
        return DotSide.right;
      case DotSide.right:
        return DotSide.left;
    }
  }
}
