import 'dart:math';

import 'package:ballabash/features/game/domain/level_config.dart';
import 'package:flutter/material.dart';

extension LevelConfigWorker on LevelConfig? {
  Color get primaryColor {
    switch (this?.colorPriority) {
      case null:
      case DotColorPriority.none:
        return Colors.pink;
      case DotColorPriority.red:
        return Colors.red.shade600;
      case DotColorPriority.blue:
        return Colors.blue.shade600;
      case DotColorPriority.green:
        return Colors.green.shade600;
    }
  }

  Color get dotColor {
    const maxRGB = 200;
    const minRGB = 50;
    int red = minRGB;
    int blue = minRGB;
    int green = minRGB;
    switch (this?.colorPriority) {
      case DotColorPriority.blue:
        blue = maxRGB;
        break;
      case DotColorPriority.green:
        green = maxRGB;
        break;
      case DotColorPriority.red:
        red = maxRGB;
        break;
      case null:
      case DotColorPriority.none:
        red = maxRGB;
        green = maxRGB;
        blue = maxRGB;
        break;
    }
    return Color.fromRGBO(
      Random().nextInt(red) + 55,
      Random().nextInt(green) + 55,
      Random().nextInt(blue) + 55,
      1.0,
    );
  }

  double calcTargetSize(BuildContext context) =>
      MediaQuery.sizeOf(context).width * (this?.targetSizeMultiplier ?? 1.0);
}
