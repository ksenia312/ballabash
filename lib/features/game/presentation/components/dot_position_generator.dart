import 'dart:math';

import 'package:flutter/material.dart';

import 'dot_position.dart';


class DotPositionGenerator {
  DotPositionGenerator({
    required this.maxX,
    required this.maxY,
    required this.objectSize,
  });

  final double maxX;
  final double maxY;
  final double objectSize;

  late final startPosition = _generate();
  late final endPosition = _generate(pair: startPosition.side);


  DotPosition _generate({DotSide? pair}) {
    final x = Random().nextDouble() * maxX;
    final y = Random().nextDouble() * maxY;
    DotSide side;
    if (pair != null) {
      side = pair.opposite();
    } else {
      side = DotWorker.fromIndex(Random().nextInt(4));
    }
    final position = _getPoint(
      x: x,
      y: y,
      side: side,
    );
    return DotPosition(
      side: side,
      rect: Rect.fromLTWH(
        position.x,
        position.y,
        objectSize,
        objectSize,
      ),
    );
  }

  Point<double> _getPoint({
    required double x,
    required double y,
    required DotSide side,
  }) {
    switch (side) {
      case DotSide.top:
        return Point(x, -objectSize);
      case DotSide.left:
        return Point(-objectSize, y);
      case DotSide.right:
        return Point(maxX, y);
      case DotSide.bottom:
        return Point(x, maxY);
    }
  }
}
