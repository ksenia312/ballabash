import 'package:ballabash/app/domain/game_repository.dart';
import 'package:ballabash/features/game/domain/level_config.dart';

import 'firebase_service.dart';

class FirebaseGameRepository extends GameRepository {
  FirebaseGameRepository(this.service);

  final FirebaseService service;

  @override
  Future<LevelConfig?> fetchConfigByLevel(int level) async {
    final data = await service.getLevelData(level);

    if (data == null) return null;
    return LevelConfig.fromJson(data);
  }

  @override
  Future<int?> fetchLevelsCount() {
    return service.getLevelsCount();
  }
}
