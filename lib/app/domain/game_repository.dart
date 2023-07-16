import 'package:ballabash/features/game/domain/level_config.dart';

abstract class GameRepository {
  Future<int?> fetchLevelsCount();

  Future<LevelConfig?> fetchConfigByLevel(int level);
}
