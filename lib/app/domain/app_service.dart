import 'package:ballabash/app/data/local/user_repository.dart';
import 'package:ballabash/app/domain/app_state.dart';
import 'package:ballabash/app/domain/game_repository.dart';
import 'package:ballabash/app/domain/app_model.dart';
import 'package:flutter/cupertino.dart';

class AppService extends ChangeNotifier {
  AppService(this.gameRepository, this.userRepository);

  final GameRepository gameRepository;
  final UserRepository userRepository;

  AppState<AppModel> state = AppState.nothing();

  Future<void> fetch() async {
    try {
      final levelsCount = await gameRepository.fetchLevelsCount();
      final current = userRepository.getCurrentLevel(levelsCount!);
      state = AppState.data(
        AppModel(levelsCount: levelsCount, current: current),
      );
    } on Exception catch (e, s) {
      state = AppState.error(error: 'Can\'t fetch levels');
      debugPrint(e.toString() + s.toString());
    } finally {
      if (hasListeners) {
        notifyListeners();
      }
    }
  }
}
