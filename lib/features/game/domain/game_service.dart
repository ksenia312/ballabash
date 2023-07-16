import 'dart:math';

import 'package:ballabash/app/data/local/user_repository.dart';
import 'package:ballabash/app/domain/app_state.dart';
import 'package:ballabash/app/domain/game_repository.dart';
import 'package:flutter/material.dart';

import 'level_config.dart';

class GameService extends ChangeNotifier {
  GameService(this.gameRepository, this.userRepository);

  AppState<LevelConfig> state = AppState.nothing();
  final GameRepository gameRepository;
  final UserRepository userRepository;

  Future<void> init(int level) async {
    state = AppState.progress();
    notifyListeners();
    try {
      final config = await gameRepository.fetchConfigByLevel(level);
      state = AppState<LevelConfig>.data(config!);
    } on Exception catch (e, s) {
      state = AppState<LevelConfig>.error(error: 'Something went wrong');
      debugPrint(e.toString() + s.toString());
    } finally {
      if (hasListeners) {
        notifyListeners();
      }
    }
  }

  void checkCompleted({
    required int counter,
    required int currentLevel,
    required int? levelsCount,
    required ValueChanged<int?> onCompleted,
  }) {
    if (state.data != null) {
      final data = state.data!;
      if (counter >= data.doneValue) {
        final incremented = data.level + 1;
        final newLevel = min(incremented, levelsCount ?? incremented);
        if (currentLevel < newLevel) {
          userRepository.setLevel(newLevel).then(
                (_) => onCompleted(levelsCount),
              );
        } else {
          onCompleted(levelsCount);
        }
      }
    }
  }
}
