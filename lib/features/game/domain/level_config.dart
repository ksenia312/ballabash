import 'package:ballabash/app/utils/num_extension.dart';

class LevelConfig {
  LevelConfig( {
    required this.level,
    required this.dotSize,
    required this.targetSizeMultiplier,
    required this.dotLifeInMilliseconds,
    required this.dotsFrequentInMilliseconds,
    required this.doneValue,
    required this.colorPriority,
  });

  final int level;
  final int doneValue;
  final int dotLifeInMilliseconds;
  final int dotsFrequentInMilliseconds;
  final double dotSize;
  final double targetSizeMultiplier;
  final DotColorPriority colorPriority;

  factory LevelConfig.fromJson(Map<String, dynamic> json) {
    return LevelConfig(
      level: json['number'] ?? -1,
      dotSize: toDouble(json['dot_size'], 30.0),
      targetSizeMultiplier: toDouble(json['target_width_ratio'], 0.8),
      dotLifeInMilliseconds: json['dot_life_in_milliseconds'] ?? 500,
      dotsFrequentInMilliseconds: json['dots_frequent_in_milliseconds'] ?? 500,
      doneValue: json['done_value'] ?? 100,
      colorPriority: ColorPriorityWorker.fromString(json['color_priority']),
    );
  }
}

enum DotColorPriority { red, blue, green, none }

extension ColorPriorityWorker on DotColorPriority {
  static DotColorPriority fromString(String? string) {
    for (final value in DotColorPriority.values) {
      if (value.name == string) {
        return value;
      }
    }
    return DotColorPriority.none;
  }
}
